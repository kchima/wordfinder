# Wordfinder

"Finding all the words that can be constructed from a given set of
letters"

Code goes in `lib`. Tests go in `spec`.

Disclosures: I thought this would be a cool application for using the "trie" data structure.
I have used a Ruby implementation of trie that I found online, 'fast-trie'.

## Included Gems
* [rspec](http://rspec.info/) - for testing
* [pry](http://pryrepl.org/) - awesome REPL
* [guard](https://github.com/guard/guard) - for autorunning tests
* [rake](https://github.com/ruby/rake) - for scripting build/test tasks
* fast-trie (external trie data structure for ruby)

## Running tests
Run tests with `bundle exec rspec`

Autorun tests with `bundle exec guard`
