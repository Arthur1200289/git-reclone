# unit testing for git-nuke

require "spec_helper"

describe GitNuke do
  def run(str)
    GitNuke.new.run(str.split)
  end

  class GitNuke
    def remotes(*s)
      %w{https://github.com/user/repo.git
          git@bitbucket.org:<user>/repo.git
          https://git.heroku.com/app.git}
    end
  end

  it "should show GitNuke help" do
    help = GitNuke::Help
    expect(run "--help").to eq help
    expect(run "-h").to eq help
  end

  it "should show GitNuke version" do
    vers = GitNuke::Version
    expect(run "--version").to eq vers
    expect(run "-v").to eq vers
  end

  it "should not crash with no args" do
    run ""
  end

  it "should not crash with args" do
    run "bitbucket"
    run "github"
    run "heroku"
  end
end

