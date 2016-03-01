require_relative "../lib/git-nuke.rb"

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

# testing sys output
def puts(*x) x.join end

