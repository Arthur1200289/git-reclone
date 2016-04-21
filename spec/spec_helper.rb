require "git-nuke.rb"

# testing sys output
def puts(*x) x.join end

# mocking remotes/deletes
class GitNuke
  @verify = false

  def pexit(*s)
    puts s
  end

  def remotes(*s)
    %w{
      https://github.com/user/repo.git
      git@bitbucket.org:<user>/repo.git
      https://git.heroku.com/app.git
    }
  end

  def nuke(*s)
    puts s
  end
end

