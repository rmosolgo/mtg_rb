require "test_helper"

class CardTest < Minitest::Test
  def find_card_by_name(card_name)
    MULTIVERSE.cards.fetch(card_name)
  end

  def test_it_gets_creature_attributes
    phyrexian_metamorph = find_card_by_name("Phyrexian Metamorph")

    assert_equal "{3}{U/P}", phyrexian_metamorph.mana_cost
    assert_equal 4, phyrexian_metamorph.converted_mana_cost
    assert_equal ["U"], phyrexian_metamorph.color_identity
    assert_equal ["Blue"], phyrexian_metamorph.colors
    assert_equal "Artifact Creature — Shapeshifter", phyrexian_metamorph.type
    assert_equal [], phyrexian_metamorph.supertypes
    assert_equal ["Artifact", "Creature"], phyrexian_metamorph.types
    assert_equal ["Shapeshifter"], phyrexian_metamorph.subtypes
    assert_equal "0", phyrexian_metamorph.power
    assert_equal "0", phyrexian_metamorph.toughness
    assert_equal nil, phyrexian_metamorph.loyalty
    rules_text = "({U/P} can be paid with either {U} or 2 life.)\nYou may have Phyrexian Metamorph enter the battlefield as a copy of any artifact or creature on the battlefield, except it's an artifact in addition to its other types."
    assert_equal rules_text, phyrexian_metamorph.text
  end

  def test_it_gets_sorcery_attributes
    cruel_ultimatum = find_card_by_name("Cruel Ultimatum")

    assert_equal "{U}{U}{B}{B}{B}{R}{R}", cruel_ultimatum.mana_cost
    assert_equal 7, cruel_ultimatum.converted_mana_cost
    assert_equal ["Blue", "Black", "Red"], cruel_ultimatum.colors
    assert_equal ["U", "B", "R"], cruel_ultimatum.color_identity
    assert_equal "Sorcery", cruel_ultimatum.type
    assert_equal [], cruel_ultimatum.supertypes
    assert_equal ["Sorcery"], cruel_ultimatum.types
    assert_equal [], cruel_ultimatum.subtypes
    assert_equal "Target opponent sacrifices a creature, discards three cards, then loses 5 life. You return a creature card from your graveyard to your hand, draw three cards, then gain 5 life.", cruel_ultimatum.text
    assert_equal nil, cruel_ultimatum.power
    assert_equal nil, cruel_ultimatum.toughness
    assert_equal nil, cruel_ultimatum.loyalty
  end

  def test_it_gets_planeswalker_attributes
    jace_beleren = find_card_by_name("Jace Beleren")

    assert_equal "Jace Beleren", jace_beleren.name
    assert_equal "{1}{U}{U}", jace_beleren.mana_cost
    assert_equal 3, jace_beleren.converted_mana_cost
    assert_equal ["Blue"], jace_beleren.colors
    assert_equal ["U"], jace_beleren.color_identity
    assert_equal "Planeswalker — Jace", jace_beleren.type
    assert_equal [], jace_beleren.supertypes
    assert_equal ["Planeswalker"], jace_beleren.types
    assert_equal ["Jace"], jace_beleren.subtypes
    assert_equal "+2: Each player draws a card.\n−1: Target player draws a card.\n−10: Target player puts the top twenty cards of his or her library into his or her graveyard.", jace_beleren.text
    assert_equal nil, jace_beleren.power
    assert_equal nil, jace_beleren.toughness
    assert_equal 3, jace_beleren.loyalty
  end

  def test_it_gets_land_attributes
    dark_depths = find_card_by_name("Dark Depths")
    assert_matching_attributes(dark_depths, {
      name: "Dark Depths",
      mana_cost: nil,
      converted_mana_cost: nil,
      colors: [],
      color_identity: [],
      type: "Legendary Snow Land",
      supertypes: ["Legendary", "Snow"],
      types: ["Land"],
      subtypes: [],
      text: "Dark Depths enters the battlefield with ten ice counters on it.\n{3}: Remove an ice counter from Dark Depths.\nWhen Dark Depths has no ice counters on it, sacrifice it. If you do, put a legendary 20/20 black Avatar creature token with flying and indestructible named Marit Lage onto the battlefield.",
      power: nil,
      toughness: nil,
      loyalty: nil
    })
  end

  def test_it_gets_transform_card_attributes
    arlinn_kord = find_card_by_name("Arlinn Kord")
    assert_matching_attributes(arlinn_kord, {
      name: "Arlinn Kord",
      names: ["Arlinn Kord","Arlinn, Embraced by the Moon"],
      mana_cost: "{2}{R}{G}",
      converted_mana_cost: 4,
      colors: ["Red", "Green"],
      color_identity: ["R", "G"],
      type: "Planeswalker — Arlinn",
      supertypes: [],
      types: ["Planeswalker"],
      subtypes: ["Arlinn"],
      text: "+1: Until end of turn, up to one target creature gets +2/+2 and gains vigilance and haste.\n0: Put a 2/2 green Wolf creature token onto the battlefield. Transform Arlinn Kord.",
      power: nil,
      toughness: nil,
      loyalty: 3
    })

    arlinn_embranced_by_the_moon = find_card_by_name("Arlinn, Embraced by the Moon")
    assert_matching_attributes(arlinn_embranced_by_the_moon, {
      name: "Arlinn, Embraced by the Moon",
      names: ["Arlinn Kord","Arlinn, Embraced by the Moon"],
      mana_cost: nil,
      converted_mana_cost: nil,
      colors: ["Red", "Green"],
      color_identity: ["R", "G"],
      type: "Planeswalker — Arlinn",
      supertypes: [],
      types: ["Planeswalker"],
      subtypes: ["Arlinn"],
      text: "+1: Creatures you control get +1/+1 and gain trample until end of turn.\n−1: Arlinn, Embraced by the Moon deals 3 damage to target creature or player. Transform Arlinn, Embraced by the Moon.\n−6: You get an emblem with \"Creatures you control have haste and ‘{T}: This creature deals damage equal to its power to target creature or player.'\"",
      power: nil,
      toughness: nil,
      loyalty: nil
    })
  end

  def  test_it_gets_flip_card_attributes
    kitsune_mystic = find_card_by_name("Kitsune Mystic")
    assert_matching_attributes(kitsune_mystic, {
      name: "Kitsune Mystic",
      names: ["Kitsune Mystic", "Autumn-Tail, Kitsune Sage"],
      mana_cost: "{3}{W}",
      converted_mana_cost: 4,
      colors: ["White"],
      color_identity: ["W"],
      type: "Creature — Fox Wizard",
      supertypes: [],
      types: ["Creature"],
      subtypes: ["Fox", "Wizard"],
      text: "At the beginning of the end step, if Kitsune Mystic is enchanted by two or more Auras, flip it.",
      power: "2",
      toughness: "3",
      loyalty: nil
    })

    autumn_tail_kitsune_sage = find_card_by_name("Autumn-Tail, Kitsune Sage")
    assert_matching_attributes(autumn_tail_kitsune_sage, {
      name: "Autumn-Tail, Kitsune Sage",
      names: ["Kitsune Mystic", "Autumn-Tail, Kitsune Sage"],
      mana_cost: "{3}{W}",
      converted_mana_cost: 4,
      colors: ["White"],
      color_identity: ["W"],
      type: "Legendary Creature — Fox Wizard",
      supertypes: ["Legendary"],
      types: ["Creature"],
      subtypes: ["Fox", "Wizard"],
      text: "{1}: Attach target Aura attached to a creature to another creature.",
      power: "4",
      toughness: "5",
      loyalty: nil
    })
  end

  def test_it_gets_split_card_attributes
    fire = find_card_by_name("Fire")
    assert_matching_attributes(fire, {
      name: "Fire",
      names: ["Fire", "Ice"],
      mana_cost: "{1}{R}",
      converted_mana_cost: 2,
      colors: ["Red"],
      color_identity: ["U", "R"],
      type: "Instant",
      supertypes: [],
      types: ["Instant"],
      subtypes: [],
      text: "Fire deals 2 damage divided as you choose among one or two target creatures and/or players.",
      power: nil,
      toughness: nil,
      loyalty: nil
    })

    ice = find_card_by_name("Ice")
    assert_matching_attributes(ice, {
      name: "Ice",
      names: ["Fire", "Ice"],
      mana_cost: "{1}{U}",
      converted_mana_cost: 2,
      colors: ["Blue"],
      color_identity: ["U", "R"],
      type: "Instant",
      supertypes: [],
      types: ["Instant"],
      subtypes: [],
      text: "Tap target permanent.\nDraw a card.",
      power: nil,
      toughness: nil,
      loyalty: nil
    })
  end

  def obj_to_attrs(obj_output)
    obj_output
      .gsub("@", "\n")
      .gsub(/(\w+)=(.*)/, '\1: \2')
  end
end
