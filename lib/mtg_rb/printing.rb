module MtgRb
  # This joins some ideas together in "concrete" piece of paper.
  # - Card
  # - Expansion
  # - Artist
  #
  # Some attributes come in "Cards" from MTGJSON but really belong to the printing.
  # - Number
  # - Flavor text
  # - Artist
  # - Rarity
  # - ?? others?
  class Printing
    def self.from_card_hash(expansion:, card:, artist:, card_hash:)
      self.new(
        card: card,
        expansion: expansion,
        artist: artist,
        flavor: card_hash.fetch("flavor", ""),
        rarity: card_hash.fetch("rarity"),
        number: card_hash.fetch("number", nil),
        multiverseid: card_hash.fetch("multiverseid", nil),
      )
    rescue KeyError => err
      p err
      p card_hash
    end

    attr_reader :card, :expansion, :artist, :flavor, :rarity, :number, :multiverseid

    def initialize(card:, expansion:, artist:, flavor:, rarity:, number:, multiverseid:)
      @card = card
      @expansion = expansion
      @artist = artist
      @flavor = flavor
      @rarity = rarity
      @number = number
      @multiverseid = multiverseid
    end
  end
end
