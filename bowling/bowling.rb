class Game
  def initialize
    @frames = Array.new(11) { [] }
    @frame_index = 0
  end

  def roll(pins)
    raise 'Pins must have a value from 0 to 10' unless valid_score?(pins)
    raise 'Pin count exceeds pins on the lane' unless valid_pin_count?(pins)
    raise 'Should not be able to roll after game is over' if game_over?
    add_score(pins)
  end

  def score
    raise 'Game is not yet over, cannot score!' if fill_balls_not_rolled?
    raise 'Score cannot be taken until the end of the game' unless game_over?
    @frames[10] << 0 if @frames[10] == []
    adjusted_scores = @frames.each_with_index do |frame, index|
      @frames[index] = adjust_for_strke(index) if strike?(frame)
      @frames[index] = adjust_for_spare(index) if spare?(frame)
    end
    adjusted_scores.map { |frame| frame.reduce(:+) }.reduce(:+)
  end

  def add_score(pins)
    frame = @frames[@frame_index]
    frame << pins
    if @frame_index == 10
      return
    elsif pins == 10 || frame.size == 2
      @frame_index += 1
    end
  end

  def adjust_for_strke(index)
    return [10] if index >= 9
    if strike?(@frames[index + 1])
      [10 + @frames[index + 1][0] + @frames[index + 2][0]]
    else
      [10 + @frames[index + 1][0] + @frames[index + 1][1]]
    end
  end

  def adjust_for_spare(index)
    return @frames[index] if index >= 9
    [@frames[index].reduce(:+) + @frames[index + 1][0]]
  end

  def spare?(frame)
    frame.reduce(:+) == 10 && frame.size == 2
  end

  def strike?(frame)
    frame == [10]
  end

  def valid_score?(pins)
    (0..10).cover?(pins)
  end

  def valid_pin_count?(pins)
    return true if @frames[@frame_index] == []
    frame_score = @frames[@frame_index].first
    (fill_ball_strike?(frame_score) && frame_score + pins <= 20) ||
      frame_score + pins <= 10
  end

  def fill_balls_not_rolled?
    return false if @frame_index < 10
    (strike?(@frames[9]) && @frames[10].size < 2) ||
      (spare?(@frames[9]) && @frames[10].empty?)
  end

  def game_over?
    return false if @frame_index < 10
    spare?(@frames[9]) && @frames[10].size == 1 ||
      strike?(@frames[9]) && @frames[10].size == 2 ||
      @frames[9].size == 2 && @frames[9].reduce(:+) < 10
  end

  def fill_ball_strike?(frame_score)
    @frame_index == 10 &&
      strike?(@frames[@frame_index - 1]) &&
      frame_score == 10
  end
end
