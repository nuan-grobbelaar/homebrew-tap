class VandagTui < Formula
  desc "Terminal client for the vandag family day-planner"
  homepage "https://github.com/nuan-grobbelaar/vandag"
  # Private repo: fetched with git over https, so the user's git credential
  # helper (macOS keychain) supplies the GitHub token. A release tarball URL
  # would not work here, because Homebrew downloads tarballs without credentials.
  url "https://github.com/nuan-grobbelaar/vandag.git",
      using:    :git,
      tag:      "v0.1.0",
      revision: "d3662828c204947ae867e4414ecb649334addc0e"
  license "MIT"
  head "https://github.com/nuan-grobbelaar/vandag.git", branch: "main"

  depends_on "go" => :build

  def install
    cd "tui" do
      system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/vandag-tui"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vandag-tui --version")
  end
end
