class Lazycmd < Formula
  desc "Lazygit-style terminal UI for running your scripts and project commands"
  homepage "https://github.com/nuan-grobbelaar/lazycmd"
  url "https://github.com/nuan-grobbelaar/lazycmd.git",
      using:    :git,
      tag:      "v0.5.1",
      revision: "25735a38aa90d632de4a6ed9b8fcd49149295cf2"
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
