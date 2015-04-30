class TerminateSessionCommand
  def self.prototype
    'X - Terminate the session'
  end

  def initialize(image)
    @image = image
  end

  def perform
    Proc.new do
      @image = nil
      exit
    end
  end
end
