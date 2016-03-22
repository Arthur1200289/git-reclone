# git-nukes parsing and opening

=begin

say git nuke (-f)
verify the remote to clone from
clean up the local repository
clone the remote, overwriting
todo: add an option to automatically add a backup of the local copy
-b / --backup, and this actually should be the default (maybe)

=end

require "colored"
require "fileutils"
require "git-nuke-version"

class GitNuke
  def run(args)
    @opts = args.select { |a| a[0] == "-" }
    @args = args - @opts
    @verify = true

    @opts.each { |o| parse_opt o }
    parse_arg @args.first
  end

  def pexit(s)
    puts s
    exit 1
  end

  def parse_opt(o)
    case o
    when "--force", "-f"
      @verify = false
    when "--help", "-h"
      puts GitNuke::Help
    when "--version", "-v"
      puts GitNuke::Version
    when "--alias"
      system "git config --global alias.nuke '!git-nuke'"
    when "--unalias"
      system "git config --global --unset alias.nuke"
    end
  end

  def parse_arg(a)
    case a
    when nil # open first remote
      verify remote
    else # check against remotes
      verify remote(a)
    end
  end

  def no_repo?
    `git status 2>&1`.split("\n").first ==
      "fatal: Not a git repository (or any of the parent directories): .git"
  end

  def git_root
    %x{git rev-parse --show-toplevel}
  end

  def remotes
    %x{git remote -v}.split("\n").map { |r| r.split[1] }.uniq
  end

  # trying to parse out which remote should be the new source
  def remote(search = /.*/)
    pexit "Not currently in a git repository.".yellow if no_repo?

    remote = remotes.find { |remote| remote.match search }

    pexit "No remotes found in this repository.".yellow if remotes.nil?

    pexit "No remotes found that match #{search.to_s.red}. All remotes:\n" +
      remotes.join("\n") if remote.nil?

    return remote
  end

  # show remote to user and confirm location (unless using -f)
  def verify(r)
    puts "Readying the nuke...".green
    puts "Local target: " << git_root
    puts "Remote source: " << r

    if @verify
      puts "Warning: this will completely overwrite the local copy.".yellow
      puts "Continue recloning local repo? [yN] "
      return unless $stdin.gets.chomp.downcase[0] == "y"
    end

    nuke remote, git_root
  end

  # overwrite the local copy of the repository with the remote one
  def nuke(remote, root)
    FileUtils.rm_rf root

    system "git clone", remote, root
  end
end


# large constant strings

GitNuke::Help = <<-HELP
git-nuke - git repo restoring tool.

`git nuke` re-clones from the first listed remote, removing the local copy.

to restore from a particular remote repository, specify the host:

`git open bit`,
`git open bucket`,
`git open bitbucket`,
  will all clone from a bitbucket remote.

HELP

