# git-nuke unit testing

require "spec_helper"

describe GitNuke do
  before :each do
    @gn = GitNuke.new(true) # testing
  end

  it "should exit and show help without args" do
    expect(@gn.fire).to eq nil
  end

  it "should show GitNuke help" do
    expect(@gn.parse_opt("--help")).to eq GitNuke::Help
    expect(@gn.parse_opt("-h")).to eq GitNuke::Help
  end

  it "should show GitNuke version" do
    expect(@gn.parse_opt("--version")).to eq GitNuke::Version
    expect(@gn.parse_opt("-v")).to eq GitNuke::Version
  end

  it "should find the correct remote" do
    expect(@gn.remote %{bitbucket}).to eq 'git@bitbucket.org:user/repo.git'
    expect(@gn.remote %{github}).to eq 'https://github.com/user/repo.git'
    expect(@gn.remote %{heroku}).to eq 'https://git.heroku.com/app.git'
  end
end

