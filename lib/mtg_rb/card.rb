module MtgRb
  # Cards have costs, types, and rules text.
  # They are "reified" by one or more printings.
  # They belong to expansions through those printings.
  class Card
    def self.from_hash(card_hash)
      self.new(
        name: card_hash.fetch("name"),
        names: card_hash.fetch("names", nil),
        mana_cost: card_hash.fetch("manaCost", nil), # double-faced can have no mana cost
        converted_mana_cost: card_hash.fetch("cmc", nil),
        colors: card_hash.fetch("colors", []),
        color_identity: card_hash.fetch("colorIdentity", []),
        type: card_hash.fetch("type"),
        supertypes: card_hash.fetch("supertypes", []),
        types: card_hash.fetch("types", []), # Unglued Tokens
        subtypes: card_hash.fetch("subtypes", []),
        text: card_hash.fetch("text", ""),
        power: card_hash.fetch("power", nil),
        toughness: card_hash.fetch("toughness", nil),
        loyalty: card_hash.fetch("loyalty", nil),
        printings: [], # will be added later
      )
    rescue KeyError => err
      p err
      p card_hash
    end

    attr_reader :name, :names, :mana_cost, :converted_mana_cost, :colors, :color_identity, :type, :supertypes, :types, :subtypes, :text, :power, :toughness, :loyalty, :printings

    def initialize(name:, names:, mana_cost:,converted_mana_cost:,colors:,color_identity:,type:,supertypes:,types:,subtypes:,text:,power:,toughness:,loyalty:, printings:)
      @name = name
      @names = names
      @mana_cost = mana_cost
      @converted_mana_cost = converted_mana_cost
      @colors = colors
      @color_identity = color_identity
      @type = type
      @supertypes = supertypes
      @types = types
      @subtypes = subtypes
      @text = text
      @power = power
      @toughness = toughness
      @loyalty = loyalty
      @printings = printings
    end
  end
end
