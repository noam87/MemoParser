module MemoParser
  module Parser
    # Given an array of tokenized markers:
    #
    #   [["@", "label", "node"], ["#", "label", "node"]]
    # 
    # Produce an array of parsed markers:
    #
    #   [[:relationship, :label, node], [:tag, :label, node]]
    #
    # Where the node is formatted according to its corresponding label. For 
    # example, a string for a ":user" label, an integer for a ":comment" label:
    #
    #   [[:relationship, :user, "joe_schmo"], [:relationship, :comment, 2456]]
    def self.parse_string(string)
      output = []
      markers_array = MemoParser::Tokenizer.tokenize(string)
      output = parse_markers_array(markers_array)
    end
    
    def self.parse_markers_array(array)
      output = []
      array.each { |marker|  output << parse_marker(marker)}
      output
    end
    
    def self.parse_marker(array)
      output = parse_node(array)
      output = parse_label(array)
      output = parse_identifier(array)
      output
    end

    def self.parse_identifier(array)
      # TODO: unuglify
      if array[0] == "@"
        array[0] = :relationships
      elsif array[0] == "#"
        array[0] = :tags
      end
      array
    end

    def self.parse_label(array)
      if array[1] == nil
        if array[0] == "@" or array[0] == :relationships
          array[1] = :memo
        else
          array[1] = :tag
        end
      else
        array[1] = array[1].to_sym
      end
      array
    end

    def self.parse_node(array)
      array[2] = array[2].to_s
      array
    end
  end
end
