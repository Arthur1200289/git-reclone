# universal version tracking

require "colored"

class GitNuke
  Version = "0.2.2"
end

GitNuke::Help = <<-HELP
#{'git nuke'.red}: a git repo restoring tool

reclones from the remote listed first, overwriting your local copy.
to restore from a particular remote repository, specify the host:

    git nuke bitbucket # reclone using bitbucket
    git nuke github # reclone using github
HELP

