# Opscode Omnibus #
Build instructions for (ruby) omnibus to build private chef within a VirtualBox
virtual machine.

# Prerequisites

## Ruby Environment

We assume you have a sane Ruby environment with the latest version Bundler installed.
Take a look at [Managing Ruby versions with RBENV](https://wiki.corp.opscode.com/display/~schisamo/Managing+Ruby+versions+with+RBENV)
on the corp wiki if you need help with this task.

## VirtualBox

Ensure you have downloaded and installed VirtualBox 4.1.8 from the [project website](https://www.virtualbox.org/wiki/Downloads).

## Git and GitHub

You probably already have `git` installed. If not follow the [excellent guide](http://help.github.com/mac-set-up-git/)
on GitHub.

Ensure your local git environment is properly configured to use your GitHub username
and token per [Github's guide](http://help.github.com/set-your-user-name-email-and-github-token/).
If either is missing, you will be prompted for input during 'Initial Configuration'.

# Initial Configuration

Ensure all required gems are installed and ready to use:

    bundle install
    
omnibus-ruby should also be checked out as a sibling to opscode-omnibus:
    cd ..
    git clone git@github.com:opscode/opscode-omnibus

# Quick start

    cp omnibus.rb.example omnibus.rb
    bundle exec rake vagrant:build

to fire up a VirtualBox 10.04 VM and start the build process.

## Put text here about the artifacts generated by the build process



