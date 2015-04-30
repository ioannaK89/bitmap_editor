class InvalidCommandGivenError < RuntimeError
  def message
    "Invalid command given"
  end
end
