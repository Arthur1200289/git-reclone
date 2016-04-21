git-nuke
========


[![Gem Version](https://badge.fury.io/rb/git-nuke.svg)](https://badge.fury.io/rb/git-nuke)
[![Build Status](https://travis-ci.org/jeremywrnr/git-nuke.svg?branch=master)](https://travis-ci.org/jeremywrnr/git-nuke)
[![Code Climate](https://codeclimate.com/github/jeremywrnr/git-nuke/badges/gpa.svg)](https://codeclimate.com/github/jeremywrnr/git-nuke)
[![MIT](https://img.shields.io/npm/l/alt.svg?style=flat)](http://jeremywrnr.com/mit-license)


git-nuke - nuke your local copy of a git repo, and reclone it from your remote.

![Screencast](http://i.imgur.com/HIvZCJB.gif)

tested and works well for:

    - github
    - bitbucket

## setup

    [sudo] gem install git-nuke

making a git alias for 'git nuke' in your `.gitconfig`:

    git-nuke --alias

removing the alias, if you don't want it anymore:

    git-nuke --unalias


## usage

    git nuke

reclones from the first git remote. to clone a specific remote, specify some part (or
all) of the host name. for example:

    git nuke bit
    git nuke bucket
    git nuke bitbucket

will all overwrite the current repository with bitbucket's remote (assuming
that some other host/repo name doesn't also match 'bitbucket').


## about

sometimes i mess up git histories, with (merges or rebasing, etc), and it
becomes more of a headache to figure out how to undo what i did than to just
reclone the remote copy and apply the changes i want in the right way. i was
doing this often enough that i figured it would be nice to have a tool that
just did this automatically. besides, it can be satisfying to just nuke your
local copy and start anew - after all, what are backups meant for?

## testing

    bundle || gem install bundler && bundle
    rake # running git-nuke's tests

