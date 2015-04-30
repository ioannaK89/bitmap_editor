class RegionSegmentColouringCommand
  def self.prototype
    'F X(int) Y(int) C(string) - Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.'
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
      set_region
    end
  end

  private

  def set_region(x = @x, y = @y, current_color=nil)
    current_color = @image.get(x, y) if current_color.nil?

    @image.set(x, y, @color)

    set_region(x+1, y, current_color) if valid_for_colouring?(x+1, y, current_color)
    set_region(x, y+1, current_color) if valid_for_colouring?(x, y+1, current_color)
    set_region(x-1, y, current_color) if valid_for_colouring?(x-1, y, current_color)
    set_region(x, y-1, current_color) if valid_for_colouring?(x, y-1, current_color)
  end

  def valid_for_colouring?(x, y, color)
    @image.get(x, y) == color &&
      @image.x_axis_include?(x) &&
      @image.y_axis_include?(y)
  end

  def validate!
    raise NonIntegerError unless @x.is_a?(Integer)
    raise NonIntegerError unless @y.is_a?(Integer)
    raise OutOfBoundsInputError unless @image.x_axis_include?(@x)
    raise OutOfBoundsInputError unless @image.y_axis_include?(@y)
  end
end
