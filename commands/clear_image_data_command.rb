class ClearImageDataCommand
  def self.prototype
    'C - Clears the table, setting all pixels to white (O).'
  end

  def initialize(image)
    @image = image
  end

  def perform
    Proc.new do
      validate!
      (0...@image.m).each do |x|
        (0...@image.n).each do |y|
          @image.set(x, y, 'O')
        end
      end
    end
  end

  private

  def validate!
    raise NonImageError unless @image.is_a?(Image)
  end
end
