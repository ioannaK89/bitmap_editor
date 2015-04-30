class NonImageError < RuntimeError
  def message
    'Image not found'
  end
end
