require "test_helper"

describe Author do
  let(:author) { Author.new }

  it "must be valid" do
    # author.must_be :valid?
    result = author.valid?
    result.must_equal true
  end
end
