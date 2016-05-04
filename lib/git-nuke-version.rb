# universal version tracking

class GitNuke
  Version = "0.1.2"
end

GitNuke::Help = <<-HELP
git-nuke - git repo restoring tool.

`git nuke` re-clones from the first listed remote, removing the local copy.

to restore from a particular remote repository, specify the host:

`git nuke bit`,
`git nuke bucket`,
`git nuke bitbucket`,
  will all clone from a bitbucket remote.

HELP

