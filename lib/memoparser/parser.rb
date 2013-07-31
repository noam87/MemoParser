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
  end
end
