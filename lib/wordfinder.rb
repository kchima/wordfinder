require 'benchmark'
require 'trie'

class Wordfinder

  def initialize()
    # instantiate variables
    @trie = Trie.new

    # pull dictionary from file and read words into memory
    file = File.open("words.txt")
    @words = file.readlines.map(&:chomp)
    file.close()

    # sort each word in words, using an array (to track multiple words which have the same sorted key)
    @sortedWords = {}
    @words.each do |word|
      @key = word.chars.sort.join
      if @sortedWords.include?(@key)
        @sortedWords[@key].push(word)
      else
        @sortedWords[@key] = [word]
      end
    end

    # build a trie out of the sorted words (each node val contains a list of all words that can be created out of the letters)
    @sortedWords.each do |sortWord, words|
      @trie.add sortWord, words
    end
  end

  # return all permutations of the root string
  def get_all_permuted_strings(s)
    0.upto(s.length - 1).flat_map do |start|
      1.upto(s.length - start).map do |finish|
        s[start, finish]
      end
    end.uniq
  end

  def find_words(string)
    # use a set for the output data structure, to ignore duplicates
    output = Set.new([])
    puts "input string: " + string

    # for all permutations of root string, walk the trie and find the list of words at the terminal node
    string = string.chars.sort.join
    @substrings = get_all_permuted_strings(string)
    @substrings.each do |substr|
      node = @trie.root
      substr.split('').each do |char|
        break unless node.walk!(char)
        if node.terminal?
          @words = @trie.get(node.full_state)
          @words.each do |word|
            # add the word to our output set
            output.add(word)
          end
        end
      end
    end
    puts output.inspect
    return output
  end
end
