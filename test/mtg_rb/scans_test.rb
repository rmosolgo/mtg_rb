require "set"
require "test_helper"

class ScansTest < Minitest::Test
  FIXTURE_PATH = File.expand_path("../../fixtures", __FILE__)

  def test_it_calls_each_image_with_images
    counter = 0
    MtgRb::Scans.each_scan(from_dir: FIXTURE_PATH) do
      counter += 1
    end
    assert_equal 548, counter
  end

  def test_it_calls_with_each_split_part
    names = Set.new

    MtgRb::Scans.each_scan(from_dir: FIXTURE_PATH) do  |expansion_code, name, entry|
      names.add(name)
      assert_instance_of Zip::Entry, entry
      assert_includes ["4ED", "SOK"], expansion_code
    end

    assert_includes names, "Homura, Human Ascendant"
    assert_includes names, "Homura's Essence"
  end

  def test_it_whitelists_expansions
    expansion_codes = Set.new

    MtgRb::Scans.each_scan(from_dir: FIXTURE_PATH, expansion_codes: ["SOK", "ALA"]) do  |expansion_code, name, entry|
      expansion_codes.add(expansion_code)
    end

    assert_equal ["SOK"], expansion_codes.to_a
  end
end
