require_relative '../models/image'

class CreateNewImageCommand
  def self.prototype
    "I M(int) N(int) - Create a new M x N image with all pixels coloured white (O)."
  end

  def initialize(m, n)
    @m = m
    @n = n
  end

  def perform
    Proc.new do
      validate!
      Image.new(@m, @n)
    end
  end

  private

  def validate!
    raise NonIntegerError unless @m.is_a?(Integer)
    raise NonIntegerError unless @n.is_a?(Integer)
    raise OutOfBoundsInputError if @m > 250
    raise OutOfBoundsInputError if @n > 250
  end
end
