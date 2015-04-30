require_relative '../presenters/image_text_presenter'

class ShowImageDataCommand
  def self.prototype
    'S - Show the contents of the current image'
  end

  def initialize(image, opts = {})
    @image = image
    @presenter = opts.fetch(:presenter) { ImageTextPresenter.new(@image) }
  end

  def perform
    Proc.new { puts @presenter.present }
  end
end
