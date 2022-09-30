RSpec.describe Scrubber::Parser do
  describe ".scrub" do
    subject { described_class.new(fields) }

    Dir.glob("spec/fixtures/*").each do |dir|
      context "when #{dir.split("/").last}" do
        let(:fields) { described_class.extract_fields("#{dir}/sensitive_fields.txt") }
        let(:input_json) { described_class.extract_json("#{dir}/input.json") }
        let(:output_json) { described_class.extract_json("#{dir}/output.json") }
        it "scrubs correctly" do
          expect(subject.scrub(input_json)).to eq(output_json)
        end
      end
    end
  end
end
