# git-nuke gem
# jeremy warner

=begin
todo: add an option to automatically add a backup of the local copy
todo: add all remotes other than the origins, maintain connections
todo: -b / --backup, and this actually should be the default (maybe)
=end

require "colored"
require "fileutils"
require "git-nuke-version"

class GitNuke
  def initialize(test=false)
    @pdelay = 0.01 # constant for arrow speed
    @testing = test
    @verify = !test
  end

  def fire(args = [])
    exit 0 if test_empty(args)
    opts = args.select {|a| a[0] == "-" }
    opts.each {|o| parse_opt o }
    exit 0 if !(@testing || opts.first)
    parse_arg((args - opts).first)
  end

  def pexit(msg)
    puts msg
    exit 1
  end

  # check to see whether any arguments were given to the fire command
  # if not, then show the help and exit without continuing through
  def test_empty(args)
    if args.length > 1
      return false
    else
      puts GitNuke::Help
      return true
    end
  end

  def parse_opt(o)
    case o
    when "--force", "-f"
      @verify = false
    when "--help", "-h"
      puts GitNuke::Help
    when "--version", "-v"
      puts GitNuke::Version
    end
  end

  def parse_arg(a)
    puts verify(remote)
    a.nil?? verify(remote) : verify(remote(a))
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

  def nukebanner
    25.times { |x| slowp "\rREADYING NUKE| ".red << "*" * x << "#==>".red }
    25.times { |x| slowp "\rREADYING NUKE| ".red << " " * x << "*" * (25 - x) << "#==>".yellow }
    printf "\rNUKE READY.".red << " " * 50 << "\n"
  end

  def slowp(x)
    sleep @pdelay
    printf x
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
    nukebanner
    puts "Remote source:\t".red << r
    puts "Local target:\t".red << git_root

    if @verify
      puts "Warning: this will completely overwrite the local copy.".yellow
      printf "Continue recloning local repo? [yN] ".yellow
      unless $stdin.gets.chomp.downcase[0] == "y"
        puts "Nuke aborted.".green
        return
      end
    end

    nuke remote, git_root.chomp unless @testing
  end

  # overwrite the local copy of the repository with the remote one
  def nuke(remote, root)
    # remove the git repo from this computer
    FileUtils.rmtree (Dir.glob("*", File::FNM_DOTMATCH).
                      select {|d| not ['.','..'].include? d })

    cloner = "git clone #{remote} #{root}"

    puts "Recloned successfully.".green if system(cloner)
  end
end

