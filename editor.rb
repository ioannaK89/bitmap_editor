require_relative 'commands'
require_relative 'errors'
require_relative 'command_parser'

class Editor
  PROMPT = '> '
  ERRORS = [
    InvalidCommandGivenError,
    NonImageError,
    NonIntegerError,
    OutOfBoundsInputError,
  ].freeze

  def initialize(opts = {})
    @image = nil
    @parser_class = opts.fetch(:parser_class) { CommandParser }
  end

  def get_command(command_str)
    @current_command = parser.parse(command_str)
  end

  def parser
    @parser_class.new(@image)
  end

  def execute_command
    result = @current_command.perform

    if @current_command.is_a?(CreateNewImageCommand)
      @image = result.call
    else
      result.call
    end
  end
end
