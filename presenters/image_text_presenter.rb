require_relative '../models/image'

class ImageTextPresenter
  def initialize(image)
    @image = image
  end

  def present
    validate!
    data.inject("") { |res, row| res += "#{row.join('')}\n" }
  end

  private

  def data
    @image.data
  end

  def validate!
    raise NonImageError unless @image.is_a?(Image)
  end
end
