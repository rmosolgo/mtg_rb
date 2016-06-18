require "date"

module MtgRb
  # This is a set of magic cards that was released together.
  # They're unique by name. They also have a three-character shortcode.
  class Expansion
    # @param [Hash] An entry in AllSets.json
    def self.from_hash(expansion_hash)

      release_date = if expansion_hash.key?("releaseDate")
        Date.strptime(expansion_hash.fetch("releaseDate"), "%Y-%m-%d")
      else
        nil
      end

      self.new({
        name: expansion_hash.fetch("name"),
        code: expansion_hash.fetch("code"),
        release_date: release_date,
        border: expansion_hash.fetch("border"),
        block: expansion_hash.fetch("block", nil),
        type: expansion_hash.fetch("type", nil),
        online_only: expansion_hash.fetch("onlineOnly", false),
        printings: [], # will be added later
      })
    rescue KeyError => err
      p err
      p expansion_hash
    end

    attr_reader :name, :code, :release_date, :border, :block, :type, :online_only, :printings

    def initialize(name:, code:, release_date:, border:, block:, type:, online_only:, printings:)
      @name = name
      @code = code
      @release_date = release_date
      @border = border
      @block = block
      @type = type
      @online_only = online_only
      @printings = printings
    end
  end
end
