$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mtg_rb'
require 'minitest/autorun'
require 'json'

# Lazy-load the multiverse so that we don't do the
# giant parsing operation when we don't need to
def Object.const_missing(name)
  if name == :MULTIVERSE
    mtg_json_path = File.expand_path("../fixtures/AllSets-x.json", __FILE__)
    mtg_json_hash = JSON.parse(File.read(mtg_json_path))
    const_set(name, MtgRb::Multiverse.from_hash(mtg_json_hash))
  else
    super
  end
end

def assert_matching_attributes(object, attributes)
  attributes.each do |key, value|
    assert_equal value, object.public_send(key)
  end
end
