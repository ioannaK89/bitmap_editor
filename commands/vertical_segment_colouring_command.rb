class VerticalSegmentColouringCommand
  def self.prototype
    'V X(int) Y1(int) Y2(int) C(string) - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).'
  end

  def initialize(x, y1, y2, color, image)
    @x = x - 1
    @y1 = y1 - 1
    @y2 = y2 - 1
    @color = color
    @image = image
  end

  def perform
    Proc.new do
      validate!
      set_vertical_line
    end
  end

  private

  def set_vertical_line
    (@y1..@y2).each do |y|
      @image.set(@x, y, @color)
    end
  end

  def validate!
    raise NonIntegerError unless @x.is_a?(Integer)
    raise NonIntegerError unless @y1.is_a?(Integer)
    raise NonIntegerError unless @y2.is_a?(Integer)
    raise OutOfBoundsInputError unless @image.x_axis_include?(@x)
    raise OutOfBoundsInputError unless @image.y_axis_include?(@y1)
    raise OutOfBoundsInputError unless @image.y_axis_include?(@y2)
  end
end
