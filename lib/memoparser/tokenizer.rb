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
  end
end
