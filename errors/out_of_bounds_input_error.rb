class OutOfBoundsInputError < RuntimeError
  def message
    'Out of bounds input found'
  end
end
