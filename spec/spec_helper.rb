require "git-nuke"
require 'fileutils'

# mock remotes/puts

class GitNuke
  def exit(x) end
  def slowp(*x) end
  def printf(*x) end
  def puts(*x)
    return x.first
  end

  def remotes
    %w{
      https://github.com/user/repo.git
      https://git.heroku.com/app.git
      git@bitbucket.org:user/repo.git
    }
  end
end

