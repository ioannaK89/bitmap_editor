class HorizontalSegmentColouringCommand
  def self.prototype
    'H X1(int) X2(int) Y(int) C(string) - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).'
  end

  def initialize(x1, x2, y, color, image)
    @x1 = x1 - 1
    @x2 = x2 - 1
    @y = y - 1
    @color = color
    @image = image
  end

  def perform
    Proc.new do
      validate!
      set_horizontal_line
    end
  end

  private

  def set_horizontal_line
    (@x1..@x2).each do |x|
      @image.set(x, @y, @color)
    end
  end

  def validate!
    raise NonIntegerError unless @x1.is_a?(Integer)
    raise NonIntegerError unless @x2.is_a?(Integer)
    raise NonIntegerError unless @y.is_a?(Integer)
    raise OutOfBoundsInputError unless @image.x_axis_include?(@x1)
    raise OutOfBoundsInputError unless @image.x_axis_include?(@x2)
    raise OutOfBoundsInputError unless @image.y_axis_include?(@y)
  end
end
