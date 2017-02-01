# universal version tracking

class GitNuke
  Version = "0.2"
end

GitNuke::Help = <<-HELP
git-nuke - git repo restoring tool

re-clones from the first listed remote, overwriting the local copy.
to restore from a particular remote repository, specify the host.

    git nuke bitbucket # reclone using bitbucket
    git nuke github # reclone using github
HELP

