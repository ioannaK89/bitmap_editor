class Image
  attr_reader :m, :n

  def initialize(m, n)
    @m = m.to_i
    @n = n.to_i
  end

  def data
    @data ||= Array.new(@n) { Array.new(@m, 'O') }
  end

  def set(x, y, color)
    data[y][x] = color
  end

  def get(x, y)
    return nil if data[y].nil?
    data[y][x]
  end

  def x_axis_include?(value)
    @m - 1 >= value && value >= 0
  end

  def y_axis_include?(value)
    @n - 1 >= value && value >= 0
  end
end
