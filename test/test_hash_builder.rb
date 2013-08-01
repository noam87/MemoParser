gem "minitest"
require 'minitest/autorun'
require_relative "helper"

class TestTokenizer < Minitest::Test
  def test_populate_label_arrays
    input = [[:relationships, :memo, "a27b"], [:relationships, :memo, "b27"],
             [:relationships, :update, "a27b"], [:tags, :tag, "poo"]]
    output = MemoParser::HashBuilder.populate_label_arrays(input)
    expected_output = { relationships: { memo: ["a27b", "b27"].sort, 
                        update: ["a27b"] }, tags: { tag: ["poo"] } }
    assert_equal expected_output, output
  end

  def test_build_label_arrays
    input = [[:relationships, :memo, "a27b"], [:relationships, :memo, "b27"],
             [:relationships, :update, "a27b"], [:tags, :tag, "poo"]]
    output = MemoParser::HashBuilder.build_label_arrays(input)
    expected_output = { relationships: { memo: [], update: [] }, 
                        tags: { tag: [] } }
    assert_equal expected_output, output
  end

  def test_build_identifier_hashes
    input = [[:relationships, :memo, "a27b"], [:relationships, :memo, "b27"],
             [:relationships, :update, "a27b"], [:tags, :tag, "poo"]]
    output = MemoParser::HashBuilder.build_identifier_hashes(input)
    expected_output = { relationships: {}, tags: {} }
    assert_equal expected_output, output
  end
end
