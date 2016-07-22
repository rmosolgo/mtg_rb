require "mtg_rb/scans/mapping"
require "mtg_rb/scans/migrate"

module MtgRb
  module Scans
    # @param from_dir [String] the path containing folders of `.zip` files
    # @param expansion_codes [Array<String>] A list of codes to unpack (default is all expansions)
    # @yieldparam expansion_code [String] the code for the currently unzipped expansion
    # @yieldparam name [String] The name for this card (half of the name, in the case of split cards)
    # @yieldparam entry [Zip::Entry] The entry in the zip file for this image
    def self.each_scan(*args, **kwargs, &block)
      MtgRb::Scans::Migrate.execute(*args, **kwargs, &block)
    end
  end
end
