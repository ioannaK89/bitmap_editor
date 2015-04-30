class NonIntegerError < RuntimeError
  def message
    'Non integer given'
  end
end
