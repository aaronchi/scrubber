module Scrubber
  class Parser
    attr_accessor :fields

    def initialize(fields)
      @fields = fields
    end

    def self.extract_fields(file)
      File.read(file).split("\n")
    end

    def self.extract_json(file)
      JSON.parse(File.read(file))
    end

    def scrub(input, scrub = false)
      case input
      when Hash
        input.each_with_object({}) do |(k, v), a|
          a[k] = scrub(v, scrub || fields.include?(k))
        end
      when Array
        input.map { |item| scrub(item, scrub) }
      when Numeric
        scrub ? input.to_s.gsub(/[[:alnum:]]/, "*") : input
      when TrueClass, FalseClass
        scrub ? "-" : input
      else
        scrub ? input.to_s.gsub(/[[:alnum:]]/, "*") : input
      end
    end
  end
end
