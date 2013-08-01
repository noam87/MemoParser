module MemoParser
  module HashBuilder
    # Given an input string, pass it through the tokenizer and parser and
    # produce a hash of the form seen in the README file.
    def self.populate_label_arrays(array)
      hash = build_label_arrays(array)
      array.each do |marker|
        identifier = marker[0]
        label = marker[1]
        node = marker[2]
        hash[identifier][label] << node
      end
      hash
    end

    def self.build_label_arrays(array)
      hash = build_identifier_hashes(array)  
      array.each do |marker|
        identifier = marker[0]
        label = marker[1]
        hash[identifier][label] = []
      end
      hash
    end

    def self.build_identifier_hashes(array)
      hash = {} 
      array.each do |marker|
        identifier = marker[0]
        hash[identifier] ||= {  }
      end
      hash
    end
  end
end
