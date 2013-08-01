gem "minitest"
require 'minitest/autorun'
require_relative "helper"

class TestTokenizer < Minitest::Test
  def test_build_hash
    input = "some string @some_marker, @ # #:not_marker 
             @:not_marker @label1:node1 @label1:node1 
             @label2:node @label2:node2 #label:node #node"
    output = MemoParser::HashBuilder.build_hash(input)
    expected_output = {
                        relationships:  
                        {
                          memo: ["some_marker"],
                          label1: ["node1"],
                          label2: ["node", "node2"]
                        },
                        tags:
                        {
                          tag: ["node"],
                          label: ["node"]
                        }
                      }
    assert_equal expected_output, output
  end

  def test_build_identifier_hashes
    input = [[:relationships, :memo, "a27b"], [:relationships, :memo, "b27"],
             [:relationships, :update, "a27b"], [:tags, :tag, "poo"]]
    output = MemoParser::HashBuilder.build_identifier_hashes(input)
    expected_output = { relationships: {}, tags: {} }
    assert_equal expected_output, output
  end

  def test_build_label_arrays
    input = [[:relationships, :memo, "a27b"], [:relationships, :memo, "b27"],
             [:relationships, :update, "a27b"], [:tags, :tag, "poo"]]
    output = MemoParser::HashBuilder.build_identifier_hashes(input)
    expected_output = { relationships: { memo: [], update: [] }, 
                        tags: { tag: [] } }
    assert_equal expected_output, output
  end

  def test_populate_label_arrays
    input = [[:relationships, :memo, "a27b"], [:relationships, :memo, "b27"],
             [:relationships, :update, "a27b"], [:tags, :tag, "poo"]]
    output = MemoParser::HashBuilder.build_identifier_hashes(input)
    expected_output = { relationships: { memo: ["a27b", "b27"], 
                        update: ["a27b"] }, tags: { tag: ["poo"] } }
    assert_equal expected_output, output
  end
end
