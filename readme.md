git-nuke
===========


[![Gem Version](https://badge.fury.io/rb/git-nuke.svg)](https://badge.fury.io/rb/git-nuke)
[![Build Status](https://travis-ci.org/jeremywrnr/git-nuke.svg?branch=master)](https://travis-ci.org/jeremywrnr/git-nuke)
[![Code Climate](https://codeclimate.com/github/jeremywrnr/git-nuke/badges/gpa.svg)](https://codeclimate.com/github/jeremywrnr/git-nuke)
[![MIT](https://img.shields.io/npm/l/alt.svg?style=flat)](http://jeremywrnr.com/mit-license)


git-nuke - a simple git remote opening tool.

tested and works well for:

    - github
    - bitbucket
    - heroku

if there are other git hosting websites that you would like to use this with,
either let me know or make a pull request with the augmentation for that host.


## setup

    [sudo] gem install git-nuke

making a git alias for 'git open' in your `.gitconfig`:

    git-nuke --alias

removing the alias, if you don't want it anymore:

    git-nuke --unalias


## usage

    git open

opens the first git remote. to open a specific remote, specify some part (or
all) of the host name. for example:

    git open bit
    git open bucket
    git open bitbucket

will all open the current repository's bitbucket remote in the browser.


## about

the original idea for this came from my friend [charlie][cel] who initially
provided me with a simple git alias that would do the same, but it only worked
for repos that were https and was not platform independent. I was also inspired
by the [git-up][gup] ruby gem in how seamlessly it integrated with git. Here is
the original git alias (made to work on osx), which charlie wrote (plop it in
your .gitconfig, if you don't want to install a ruby gem to open most of your
git remotes):

```
[alias]
    git-nuke = "!open $(git remote -v $@ | grep -o 'http\\S*' | head -1); :"
```

[cel]:https://github.com/clehner
[gup]:https://github.com/aanand/git-up


## testing

    bundle || gem install bundler && bundle
    rake # running git-nuke's tests

