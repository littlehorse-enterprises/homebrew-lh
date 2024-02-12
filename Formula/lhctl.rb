class Lhctl < Formula
  desc "LittleHorse CLI for managing all things LittleHorse"
  homepage "https://littlehorse.dev/docs/developer-guide/lhctl"
  url "https://github.com/littlehorse-enterprises/littlehorse.git",
      tag:      "0.7.2",
      revision: "7a0c34065f69a9d2a43e14146325124b7f78381d"
  license "SSPL-1.0"
  head "https://github.com/littlehorse-enterprises/littlehorse.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=#{version} -X main.buildSource=homebrew"
    system "go", "build", "-C", "lhctl", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "Generally a UserTaskRun", shell_output("#{bin}/lhctl --help")
  end
end
