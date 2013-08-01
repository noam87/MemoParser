gem "minitest"
require 'minitest/autorun'
require_relative "helper"

class TestTokenizer < Minitest::Test
  def test_to_hash
    input = "some string @some_marker, @ # #:not_marker 
             @:not_marker @label1:node1 @label1:node1 
             @label2:node @label2:node2 #label:node #node"
    output = MemoParser.to_hash(input)
    expected_output = {
                        relationships:  
                        {
                          memo: ["some_marker"],
                          label1: ["node1"],
                          label2: ["node", "node2"].sort
                        },
                        tags:
                        {
                          tag: ["node"],
                          label: ["node"]
                        }
                      }
    assert_equal expected_output, output
  end
end
