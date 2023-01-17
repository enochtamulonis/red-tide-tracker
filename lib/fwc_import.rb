class FwcImport
    HEADER_NAMES = ["County", "Date Collected", "Alongshore Inshore", 
        "Offshore", "Site Location", "Collector"]
    def initialize(filepath)
        File.open(filepath, "rb") do |io|
            reader = PDF::Reader.new(io)
            reader.pages.each do |page|
              table_content = page.text.split("\n\n\n")[-1]
              binding.pry
            end
        end
    end

    def extract_data_from_page(page)
        # Todo: Add logic to extract
    end
end