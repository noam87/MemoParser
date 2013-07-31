gem "minitest"
require 'minitest/autorun'
require_relative "helper"

class TestTokenizer < Minitest::Test
  def test_tokenize
    input = "some string @some_marker, @ # #:not_marker 
             @:not_marker @label1:node1 @label1:node1 
             @label2:node #label:node"
    output = MemoParser::Tokenizer.tokenize(input)
    expected_output = [
                        ["@", "", "some_marker"], ["@", "label1", "node1"],
                        ["@", "label2", "node"],
                        ["#", "label", "node"]
                      ]

    assert output == expected_output
  end

  def test_tokenize_markers_array
    input = ["@some_label:some_node", "#some_label:some_node"]
    output = MemoParser::Tokenizer.tokenize_markers_array(input)
    expected_output =  [["@", "some_label", "some_node"], 
                        ["#", "some_label", "some_node"]]

    assert output == expected_output
  end

  def test_tokenize_unlabeled_marker
    input = "@some_node"
    output = MemoParser::Tokenizer.tokenize_marker(input)
    expected_output = ["@", "", "some_node"]

    assert output == expected_output
  end

  def test_tokenize_marker
    input = "@some_label:some_node"
    output = MemoParser::Tokenizer.tokenize_marker(input)
    expected_output = ["@", "some_label", "some_node"]

    assert output == expected_output
  end
  
  def test_select_markers
    input = "some string @some_marker, @ # #:not_marker 
             @:not_marker @label1:node1 @label1:node1 
             @label2:node #label:node"
    output = MemoParser::Tokenizer.select_markers(input)
    expected_output = ["@some_marker", "@label1:node1", "@label2:node", 
                       "#label:node"]

    assert output == expected_output
  end
end
