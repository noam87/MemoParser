module MemoParser
  module Tokenizer
    # Given the following string of text with makrers of the form
    #
    #     (identifier)(label):(node) 
    #
    #Eg: 
    #
    #     @comment_to:57689
    #
    # Produce the following array:
    #
    #     [["identifier", "label", "node"], ["identifier", "label", "node"]]
    #
    # Eg:
    #     [["@", "comment", "57689"]]
    
    # match[0] => full marker
    # match[1] => identifier
    # match[3] => label
    # match[4] => node
    MARKER_REGEX = /([@#])((\w+):)?(\w+)/

    def self.tokenize(string)
      markers_array = select_markers(string) 
      output = tokenize_markers_array(markers_array)
    end

    def self.select_markers(string)
      split_string = string.split
      output = split_string.select { |word| word =~ MARKER_REGEX }.uniq
    end

    def self.tokenize_markers_array(array)
      output = []
      array.each do |marker|
        output << tokenize_marker(marker)
      end
      output
    end

    def self.tokenize_marker(string)
      match = MARKER_REGEX.match(string)
      output = [match[1], match[3], match[4]]
      output
    end

  end
end
