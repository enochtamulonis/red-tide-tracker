class FwcImport
    HEADER_NAMES = ["County", "Date Collected", "Alongshore Inshore", 
        "Offshore", "Site Location", "Collector"]
    def initialize(filepath)
        File.open(filepath, "rb") do |io|
            reader = PDF::Reader.new(io)
            reader.pages.each do |page|
              table_content = page.text.split("\n\n\n")[-1]
              rows = table_content.split("\n\n")
              county = rows[0].split("\n")[-1]
              rows[1..-1].each do |row|
                data = extract_data_from_row(row)
                data[:county] = county
                #FwcReport.create_or_find_by!(data)
              end
            end
        end
    end

    def extract_data_from_row(row)
        text_values = row.gsub("\n", "").split("   ").compact_blank
        county, date_collected, alongshore, offshore, location, collector = text_values
        data = {
            county: county&.strip, 
            date_collected: date_collected&.strip,
            inshore_level: alongshore&.strip, 
            offshore_level: offshore&.strip, 
            site_location: location&.strip, 
            collector: collector&.strip
        }
        data[:site_location] += text_values[-1]
        data
    end
end