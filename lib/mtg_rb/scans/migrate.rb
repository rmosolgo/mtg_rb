# frozen_string_literal: true
require "zip"

module MtgRb
  module Scans
    module Migrate
      def self.execute(from_dir:, expansion_codes: AllExpansions, &each_image)
        # Find all .zip files in the directory
        zip_glob = File.join(from_dir, "**", "ENG*.zip")
        filepaths = Dir.glob(zip_glob).sort

        filepaths.each_with_index do |filepath, idx|
          expansion_name = filepath.split("/")[-2]
          expansion_code = MtgRb::Scans::MAPPING[expansion_name]
          progress = "#{idx + 1} / #{filepaths.length} (#{filepath})"

          if expansion_code.nil?
            puts "  xxx Couldn't identify expansion #{progress}"
          elsif expansion_codes.include?(expansion_code)
            puts "Unzipping #{expansion_code} #{progress}"
            Zip::File.open(filepath) do |zip_file|
              zip_file.each do |entry|
                if !entry.name.end_with?(".jpg")
                  # skip folder entry:
                  next
                else
                  first_name, second_name = entry.name.sub(".jpg", "").split(/(?: - |_)/)
                  yield(expansion_code, first_name, entry)
                  if second_name
                    yield(expansion_code, second_name, entry)
                  end
                end
              end
            end
          else
            puts "  --> Skipping #{expansion_code} #{progress}"
          end
        end
      end

      module AllExpansions
        def self.include?(expansion_code)
          true
        end
      end
    end
  end
end
