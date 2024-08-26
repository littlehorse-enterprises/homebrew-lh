class Lhctl < Formula
  desc "LittleHorse CLI for managing all things LittleHorse"
  homepage "https://littlehorse.dev/docs/developer-guide/lhctl"
  url "https://github.com/littlehorse-enterprises/littlehorse.git",
      tag:      "v0.11.0",
      revision: "4b018c1b62e6104ddff1e62f7631ed88b3393352"
  license "SSPL-1.0"
  head "https://github.com/littlehorse-enterprises/littlehorse.git", tag: "v0.11.0"

  depends_on "go" => :build

  def install
    system "./local-dev/setup-go.sh"
    ldflags = "-X main.version=#{version} -X main.commit=homebrew"
    system "go", "build", "-C", "lhctl", *std_go_args(ldflags:)
  end

  test do
    assert_match "Generally a UserTaskRun", shell_output("#{bin}/lhctl --help")
  end
end
