require 'pry'

class ShowManualCommand
  COMMANDS = [
    CreateNewImageCommand,
    PixelColouringCommand,
    VerticalSegmentColouringCommand,
    HorizontalSegmentColouringCommand,
    RegionSegmentColouringCommand,
    ShowManualCommand,
    ShowImageDataCommand,
    TerminateSessionCommand
  ].freeze

  def self.prototype
    'M - Shows all the supported commands'
  end

  def perform
    Proc.new do
      puts pretty_instructions
    end
  end

  private

  def pretty_instructions
    instructions.inject("") { |res, instruction| res << "\t * #{instruction}\n" }
  end

  def instructions
    COMMANDS.map(&:prototype)
  end
end
