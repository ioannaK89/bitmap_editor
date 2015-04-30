class PixelColouringCommand
  def self.prototype
    'L X(int) Y(int) C(string) - Colours the pixel (X,Y) with colour C.'
  end

  def initialize(x, y, color, image)
    @x = x - 1
    @y = y - 1
    @color = color
    @image = image
  end

  def perform
    Proc.new do
      validate!
      @image.set(@x, @y, @color)
    end
  end

  private

  def validate!
    raise NonIntegerError unless @x.is_a?(Integer)
    raise NonIntegerError unless @y.is_a?(Integer)
    raise OutOfBoundsInputError unless @image.x_axis_include?(@x)
    raise OutOfBoundsInputError unless @image.y_axis_include?(@y)
  end
end
