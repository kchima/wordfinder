require 'wordfinder'

describe Wordfinder do
  it "returns the proper permutations of 'laa'" do
    expect(subject.find_words 'laa').to eq Set.new(['a', 'aa', 'al', 'aal', 'la', 'ala', 'l', 'aal'])
  end

  it "does a bunch of random tests" do
    def random_string(length)
      length.times.map { ('a'..'z').to_a.sample }.join
    end

    TEST_LENGTHS = [4, 8, 12, 50, 100, 200]
    wordFinder = Wordfinder.new
    Benchmark.bm(10) do |x|
      TEST_LENGTHS.each do |length|
        x.report("#{length} chars:") { wordFinder.find_words random_string(length) }
      end
    end
  end
end
