class Lhctl < Formula
  desc "LittleHorse CLI for managing all things LittleHorse"
  homepage "https://littlehorse.dev/docs/developer-guide/lhctl"
  url "https://github.com/littlehorse-enterprises/littlehorse.git",
      tag:      "0.9.0",
      revision: "050e379f3cdb07d43902a1e9ae9b4dc474af5a65"
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
