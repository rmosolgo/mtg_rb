# MtgRb

Normalize `MTGJSON` into a coherent, normalized Ruby object tree.

```ruby
mtg_json_path = File.expand_path("../path/to/AllSets-x.json", __FILE__)
mtg_json_hash = JSON.parse(File.read(mtg_json_path))
MULTIVERSE = MtgRb::Multiverse.from_hash(mtg_json_hash)
MULTIVERSE.expansions["Conflux"] # => Expansion instance
MULTIVERSE.cards["Icy Manipulator"] # => Card instance
```

`Card` and `Expansion` are joined by `Printing`.
