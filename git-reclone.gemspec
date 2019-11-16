lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "git-reclone-version"

Gem::Specification.new do |g|
  g.author      = "Jeremy Warner"
  g.email       = "jeremy.warner@berkeley.edu"

  g.name        = "git-reclone"
  g.version     = GitReclone::Version
  g.platform    = Gem::Platform::RUBY
  g.date        = Time.now.strftime("%Y-%m-%d")
  g.summary     = "reclone a local git repo from the remote."
  g.description = "reclone a local git repo from the remote."
  g.homepage    = "http://github.com/jeremywrnr/git-reclone"
  g.license     = "MIT"

  g.add_dependency "colored", ">= 1.2", "~> 1.2"
  g.add_development_dependency "ronn"
  g.add_development_dependency "rake"
  g.add_development_dependency "rspec"

  g.files        = Dir.glob("{bin,lib}/**/*") + %w(readme.md)
  g.executables  = Dir.glob("bin/*").map(&File.method(:basename))
  g.require_path = 'lib'
end
