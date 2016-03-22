lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "git-nuke-version"

Gem::Specification.new do |g|
  g.author      = "Jeremy Warner"
  g.email       = "jeremywrnr@gmail.com"

  g.name        = "git-nuke"
  g.version     = GitNuke::Version
  g.platform    = Gem::Platform::RUBY
  g.date        = Time.now.strftime("%Y-%m-%d")
  g.summary     = "restore a corrupted local git repo to the remote's copy."
  g.description = "destroy a corrupted local git repo, and reclone to the remote's copy."
  g.homepage    = "http://github.com/jeremywrnr/git-nuke"
  g.license     = "MIT"

  g.add_dependency "colored", ">= 1.2", "~> 1.2"
  g.add_development_dependency "ronn", '~> 0'
  g.add_development_dependency "rake", '~> 0'
  g.add_development_dependency "rspec", '~> 0'
  g.post_install_message = "Run 'git-nuke --alias' to add 'git nuke'"

  g.files        = Dir.glob("{bin,lib}/**/*") + %w(readme.md)
  g.executables  = Dir.glob("bin/*").map(&File.method(:basename))
  g.require_path = 'lib'
end

