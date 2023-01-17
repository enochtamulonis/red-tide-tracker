class Walker
    def intialize
    end

    def set_stuff(*args)
        binding.pry
    end
end

class FwcImport
    def initialize(filepath)
        File.open(filepath, "rb") do |io|
            reader = PDF::Reader.new(io)
            binding.pry
        end
    end
end