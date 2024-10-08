class LhctlAT08 < Formula
  desc "LittleHorse CLI for managing all things LittleHorse"
  homepage "https://littlehorse.dev/docs/developer-guide/lhctl"
  url "https://github.com/littlehorse-enterprises/littlehorse.git",
      tag:      "0.8.1",
      revision: "d5cdffe39e5edb9a55958aa1cf2254ae33dd921f"
  license "SSPL-1.0"
  head "https://github.com/littlehorse-enterprises/littlehorse.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=#{version} -X main.buildSource=homebrew"
    system "go", "build", "-C", "lhctl", *std_go_args(ldflags:)
  end

  test do
    assert_match "Generally a UserTaskRun", shell_output("#{bin}/lhctl --help")
  end
end
