class Game
  def initialize
    @frames = setup_frames
  end

  def roll(pins)
    validate_game_in_progress
    current_frame.add_score(pins)
  end

  def score
    validate_fill_balls_played
    validate_game_over
    adjust_scores!
    @frames.map(&:total).reduce(:+)
  end

  private

  def setup_frames
    Array.new(9) { Frame.new } + [LastFrame.new]
  end

  def adjust_scores!
    @frames.each_with_index do |frame, index|
      frame.score = frame.total + adjust_for_strike(index) if frame.strike?
      frame.score = frame.total + adjust_for_spare(index) if frame.spare?
    end
  end

  def adjust_for_spare(index)
    @frames[index + 1].first
  end

  def adjust_for_strike(index)
    if @frames[index + 1].strike?
      @frames[index + 1].first + @frames[index + 2].first
    else
      @frames[index + 1].first + @frames[index + 1].last
    end
  end

  def current_frame
    @frames.detect(&:open?)
  end

  def game_in_progress?
    @frames.last.open?
  end

  def validate_game_in_progress
    raise 'Should not be able to roll after game is over' unless game_in_progress?
  end

  def validate_fill_balls_played
    raise 'Game is not yet over, cannot score!' if game_in_progress? && current_frame.fill_balls?
  end

  def validate_game_over
    raise 'Score cannot be taken until the end of the game' if game_in_progress?
  end

  class Frame
    def initialize
      @scores = []
    end

    def score=(pins)
      @scores = [pins]
    end

    def first
      @scores.first || 0
    end

    def last
      @scores.last || 0
    end

    def total
      @scores.empty? ? 0 : @scores.reduce(:+)
    end

    def add_score(pins)
      raise 'Pins must have a value from 0 to 10' unless (0..10).cover?(pins)
      raise 'Pin count exceeds pins on the lane' unless valid_score?(pins)
      @scores << pins
    end

    def open?
      !strike? && @scores.size < 2
    end

    def strike?
      @scores == [10]
    end

    def spare?
      total == 10 && @scores.size == 2
    end

    def valid_score?(pins)
      total + pins <= 10
    end

    def fill_balls?
      false
    end
  end

  class LastFrame < Frame
    def open?
      fill_balls? ? @scores.size < 3 : @scores.size < 2
    end

    def valid_score?(pins)
      return last + pins <= 20 if last == 10
      last + pins <= 10
    end

    def fill_balls?
      first == 10 || spare?
    end
  end
end
