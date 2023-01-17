class FwcImport
    HEADER_NAMES = ["County", "Date Collected", "Alongshore Inshore", 
        "Offshore", "Site Location", "Collector"]
    def initialize(filepath)
        File.open(filepath, "rb") do |io|
            reader = PDF::Reader.new(io)
            reader.pages.each do |page|
              table_content = page.text.split("\n\n\n")[-1]
              rows_by_county = table_content.split("\n\n")
              county = rows_by_county[0].split("\n")[-1]
              rows_by_county[1..-1].each do |row|
                extract_data_from_row(row)
              end
            end
        end
    end

    def extract_data_from_row(row)
        text_values = row.gsub("\n", "").split("   ").compact_blank
        county, date_collected, alongshore, offshore, location, collector = text_values
        if text_valuese.size > 6
            location += " " + text_values[-1].strip
        end
    end
end