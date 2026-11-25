class Lazycmd < Formula
  desc "Lazygit-style terminal UI for running your scripts and project commands"
  homepage "https://github.com/nuan-grobbelaar/lazycmd"
  url "https://github.com/nuan-grobbelaar/lazycmd.git",
      using:    :git,
      tag:      "v0.1.3",
      revision: "bae37208afac812c85983151604f43f3486dc413"
  head "https://github.com/nuan-grobbelaar/lazycmd.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/lazycmd"
    bin.install_symlink "lazycmd" => "lc"
  end

  test do
    assert_predicate bin/"lazycmd", :executable?
    assert_path_exists bin/"lc"
  end
end
