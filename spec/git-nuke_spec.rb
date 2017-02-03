# git-nuke unit testing

require "spec_helper"

describe GitNuke do
  before :each do
    @gn = GitNuke.new(true) # testing
  end

  it "should exit without args" do
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

  it "should show all remotes after finding no match" do
    no_remote_err = "No remotes found that match \e[31mfake\e[0m. All remotes:\n" + @gn.remotes.join("\n")
    expect(@gn.remote 'fake').to eq no_remote_err
  end
end

