class SecretHandshake
  def initialize(input)
    @code = convert_to_valid_binary(input)
    @handshake = []
  end

  def convert_to_valid_binary(input)
    if input.class == String && input !~ /[^01]/
      input
    elsif input.class == Fixnum
      input.to_s(2)
    else
      '0'
    end
  end

  def commands
    array = @code.chars.reverse
    @handshake << 'wink' if array[0] == '1'
    @handshake << 'double blink' if array[1] == '1'
    @handshake << 'close your eyes' if array[2] == '1'
    @handshake << 'jump' if array[3] == '1'
    @handshake.reverse! if array[4] == '1'
    @handshake
  end
end
