require "git-reclone"
require 'fileutils'

# mock remotes/puts

class GitReclone
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

