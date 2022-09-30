# frozen_string_literal: true

require "json"
require_relative "scrubber/version"
require_relative "scrubber/parser"

module Scrubber
  class Error < StandardError; end

  def self.run(fields_file, input_file, ouput_file_name = nil)
    fields = Parser.extract_fields(fields_file)
    input = Parser.extract_json(input_file)
    output = Parser.new(fields).scrub(input)
    File.write(ouput_file_name || "output.json", JSON.pretty_generate(output))
  end
end
