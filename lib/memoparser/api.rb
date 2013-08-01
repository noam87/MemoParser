module MemoParser
  def self.to_hash(string)
    markers_array = MemoParser::Parser.parse_string(string) 
    hash = MemoParser::HashBuilder.populate_label_arrays(markers_array)
  end
end
