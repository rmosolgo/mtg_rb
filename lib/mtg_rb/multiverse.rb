module MtgRb
  # A multiverse contains cards, expansions, printings, etc
  # It is the entry point for the data and can be created from MTGJSON.
  class Multiverse
    # @param [Hash] The result of parsing AllSets.json
    # @return [Multiverse] A populated multiverse from JSON
    def self.from_hash(all_expansions)

      # {name => object} lookup tables
      cards_cache = {}
      artists_cache = {}
      expansions_cache = {}

      all_expansions.each do |expansion_code, expansion_hash|
        expansion = MtgRb::Expansion.from_hash(expansion_hash)
        expansion_hash.fetch("cards").each do |card_hash|
          card_name = card_hash.fetch("name")
          card = cards_cache[card_name] ||= MtgRb::Card.from_hash(card_hash)
          artist_name = card_hash.fetch("artist")
          artist = artists_cache[artist_name] ||= MtgRb::Artist.new(name: artist_name, printings: [])
          printing = MtgRb::Printing.from_card_hash(
            expansion: expansion,
            card: card,
            artist: artist,
            card_hash: card_hash,
          )
          card.printings << printing
          artist.printings << printing
          expansion.printings << printing
        end
        expansions_cache[expansion.name] = expansion
      end

      self.new({
        cards: cards_cache,
        artists: artists_cache,
        expansions: expansions_cache,
      })
    end

    attr_reader :cards, :artists, :expansions

    def initialize(cards:, artists:, expansions:)
      @cards = cards
      @artists = artists
      @expansions = expansions
    end
  end
end
