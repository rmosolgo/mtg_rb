# MtgRb

## Card objects from MTGJSON

Normalize `MTGJSON` into a coherent, normalized Ruby object tree.

```ruby
mtg_json_path = File.expand_path("../path/to/AllSets-x.json", __FILE__)
mtg_json_hash = JSON.parse(File.read(mtg_json_path))
MULTIVERSE = MtgRb::Multiverse.from_hash(mtg_json_hash)
MULTIVERSE.expansions["Conflux"] # => Expansion instance
MULTIVERSE.cards["Icy Manipulator"] # => Card instance
```

`Card` and `Expansion` are joined by `Printing`.

## Manipulate scans

There are [places you can get zips](http://blog.mtgbr.com/imagens/) of high-quality MTG scans. You can unzip them and write them to new files.

```ruby
MtgRb::Scans::Migrate.execute(
  # this directory contains `**/ENG*.zip` files of of scans
  from_dir: "~/Downloads/mtg_scans",
  # optional whitelist expansions, defaults to all expansions
  expansion_codes: ["ALA", "CON", "ARB"],
) do |expansion_code, name, entry|
  # This block gets called with each card.
  #
  # In the case of split cards,
  # the block will be called twice with the same entry
  #
  # `entry` is a Zip::Entry from "rubyzip"
  entry.expand("#{expansion_code}/#{name}.jpg")
end
```
