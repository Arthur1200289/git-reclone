require "spec_helper"

# git-reclone unit testing

describe GitReclone do
  before :each do
    @gn = GitReclone.new(true) # testing
  end

  it "should exit without args" do
    expect(@gn.fire).to eq nil
  end

  it "should show GitReclone help" do
    expect(@gn.parse_opt("--help")).to eq GitReclone::Help
    expect(@gn.parse_opt("-h")).to eq GitReclone::Help
  end

  it "should show GitReclone version" do
    expect(@gn.parse_opt("--version")).to eq GitReclone::Version
    expect(@gn.parse_opt("-v")).to eq GitReclone::Version
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

  it "should handle pathnames with spaces" do
    remote = "https://github.com/jeremywrnr/git-reclone.git"
    gn_test_dir = "../test dir " + Time.now.to_s
    begin
      expect(@gn.reclone remote, gn_test_dir).to eq "\e[32mRecloned successfully.\e[0m"
    ensure
      FileUtils.rm_rf(gn_test_dir)
    end
  end
end

