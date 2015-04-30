class CommandParser

  def initialize(image)
    @image = image
  end

  def parse(command_str)
    command_for(command_str)
  end

  def command_for(command_str)
    case command_str
    when /^I (\d+) (\d+)$/
      CreateNewImageCommand.new($1.to_i, $2.to_i)
    when /^L (\d+) (\d+) ([A-Z])$/
      PixelColouringCommand.new($1.to_i, $2.to_i, $3, @image)
    when /^V (\d+) (\d+) (\d+) ([A-Z])$/
      VerticalSegmentColouringCommand.new($1.to_i, $2.to_i, $3.to_i, $4, @image)
    when /^H (\d+) (\d+) (\d+) ([A-Z])$/
      HorizontalSegmentColouringCommand.new($1.to_i, $2.to_i, $3.to_i, $4, @image)
    when /^F (\d+) (\d+) ([A-Z])$/
      RegionSegmentColouringCommand.new($1.to_i, $2.to_i, $3, @image)
    when /^S$/
      ShowImageDataCommand.new(@image)
    when /^X$/
      TerminateSessionCommand.new(@image)
    when /^M$/
      ShowManualCommand.new
    when /^C$/
      ClearImageDataCommand.new(@image)
    else
      raise InvalidCommandGivenError
    end
  end
end
