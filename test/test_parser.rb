gem "minitest"
require 'minitest/autorun'
require_relative "helper"

class TestTokenizer < Minitest::Test
  def test_parse_string
    input = "only these are markers: @label:node #label:node"
    output = MemoParser::Parser.parse_string(input)
    expected_output = [[:relationships, :label, "node"], 
                      [:tags, :label, "node"]]
    assert_equal expected_output, output
  end

  def test_parse_markers_array
    input = [["@", "label", "node"], ["#", "label", "node"]]
    output = MemoParser::Parser.parse_markers_array(input)
    expected_output = [[:relationships, :label, "node"], 
                      [:tags, :label, "node"]]
    assert_equal expected_output, output
  end

  def test_parse_marker
    at_input = ["@", "label", "node"]
    tag_input = ["#", "label", "node"]
    at_output = MemoParser::Parser.parse_marker(at_input)
    tag_output = MemoParser::Parser.parse_marker(tag_input)
    expected_at_output = [:relationships, :label, "node"]
    expected_tag_output = [:tags, :label, "node"]
    assert_equal expected_at_output, at_output
    assert_equal expected_tag_output, tag_output
  end

  def test_parse_identifier
    at_input = ["@", "label", "node"]
    tag_input = ["#", "label", "node"]
    at_output = MemoParser::Parser.parse_identifier(at_input)
    tag_output = MemoParser::Parser.parse_identifier(tag_input)
    expected_at_output = [:relationships, "label", "node"]
    expected_tag_output = [:tags, "label", "node"]
    assert_equal expected_at_output, at_output
    assert_equal expected_tag_output, tag_output
  end

  def test_parse_label
    at_input = ["@", "label", "node"]
    tag_input = ["#", "label", "node"]
    at_output = MemoParser::Parser.parse_label(at_input)
    tag_output = MemoParser::Parser.parse_label(tag_input)
    expected_at_output = ["@", :label, "node"]
    expected_tag_output = ["#", :label, "node"]
    assert_equal expected_at_output, at_output
    assert_equal expected_tag_output, tag_output
  end

  def test_parse_nil_label
    at_input = ["@", nil, "node"]
    tag_input = ["#", nil, "node"]
    at_output = MemoParser::Parser.parse_label(at_input)
    tag_output = MemoParser::Parser.parse_label(tag_input)
    expected_at_output = ["@", :memo, "node"]
    expected_tag_output = ["#", :tag, "node"]
    assert_equal expected_at_output, at_output
    assert_equal expected_tag_output, tag_output
  end

  def test_parse_node
    at_input = ["@", "label", "node"]
    tag_input = ["#", "label", "node"]
    at_output = MemoParser::Parser.parse_node(at_input)
    tag_output = MemoParser::Parser.parse_node(tag_input)
    expected_at_output = ["@", "label", "node"]
    expected_tag_output = ["#", "label", "node"]
    assert_equal expected_at_output, at_output
    assert_equal expected_tag_output, tag_output
  end
end
