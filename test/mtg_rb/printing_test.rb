require "test_helper"

class PrintingTest < Minitest::Test
  def it_gets_all_printings_for_a_card
    naturalize_1 = MULTIVERSE.expansions["Gatecrash"].printings.find { |p| p.card.name == "Naturalize" }
    naturalize_2 = MULTIVERSE.expansions["Shards of Alara"].printings.find { |p| p.card.name == "Naturalize" }
    assert_equal naturalize_1.card, naturalize_2.card
    assert_equal 17, naturalize_1.card.printings.length
  end

  def test_it_gets_printing_specific_attributes
    rancor_1 = MULTIVERSE.expansions["Urza's Legacy"].printings.find { |p| p.card.name == "Rancor" }
    rancor_2 = MULTIVERSE.expansions["Magic 2013"].printings.find { |p| p.card.name == "Rancor" }

    assert_matching_attributes(rancor_1, {
      rarity: "Common",
      flavor: "Hatred outlives the hateful.",
      number: "110",
    })

    assert_matching_attributes(rancor_2, {
      rarity: "Uncommon",
      flavor: "",
      number: "185",
    })
  end
end
