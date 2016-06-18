module MtgRb
  # This artist has contributed to one or more printings
  class Artist
    attr_reader :name, :printings
    def initialize(name:, printings:)
      @name = name
      @printings = printings
    end
  end
end
