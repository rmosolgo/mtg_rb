require "test_helper"

class MultiverseTest < Minitest::Test
  def test_it_builds_expansions
    total_expansions = 192
    assert_equal total_expansions, MULTIVERSE.expansions.length
    assert_equal total_expansions, MULTIVERSE.expansions.values.map(&:name).uniq.length
    assert_equal total_expansions, MULTIVERSE.expansions.values.map(&:code).uniq.length
  end

  def test_it_builds_cards
    total_cards = 16187
    assert_equal total_cards, MULTIVERSE.cards.length
    assert_equal total_cards, MULTIVERSE.cards.values.map(&:name).uniq.length
  end

  def test_it_builds_artists
    total_artists = 632
    assert_equal total_artists, MULTIVERSE.artists.length
    assert_equal total_artists, MULTIVERSE.artists.values.map(&:name).uniq.length
  end
end
