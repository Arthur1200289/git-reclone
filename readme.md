git-reclone :rocket:
=================


[![MIT](https://img.shields.io/npm/l/alt.svg?style=flat)](http://jeremywrnr.com/mit-license)
-[![Gem Version](https://badge.fury.io/rb/git-reclone.svg)](https://badge.fury.io/rb/git-reclone)
[![Build Status](https://travis-ci.org/jeremywrnr/git-reclone.svg?branch=master)](https://travis-ci.org/jeremywrnr/git-reclone)
[![Code Climate](https://codeclimate.com/github/jeremywrnr/git-reclone/badges/gpa.svg)](https://codeclimate.com/github/jeremywrnr/git-reclone)


destroy your local copy of a git repo, and reclone it from your remote.

![Screencast](http://i.imgur.com/HIvZCJB.gif)

tested and works well for:

    - github
    - bitbucket

## setup

    [sudo] gem install git-reclone

This will enable the `git reclone` command automatically!


## usage

    git reclone

reclones from the first git remote. to clone a specific remote, specify some
part (or all) of the host name. for example:

    git reclone bit
    git reclone bucket
    git reclone bitbucket

will all overwrite the current repository with bitbucket's remote (assuming
that some other host/repo name doesn't also match 'bitbucket').


## about

sometimes i mess up git histories, with (merges or rebasing, etc), and it
becomes more of a headache to figure out how to undo what i did than to just
reclone the remote copy and apply the changes i want in the right way. i was
doing this often enough that i figured it would be nice to have a tool that
just did this automatically. besides, it can be satisfying to just reclone your
local copy and start anew - after all, what are backups meant for?

## testing

    bundle || gem install bundler && bundle
    rake # running git-reclone's tests

