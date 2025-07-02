class Lhctl < Formula
  desc "LittleHorse CLI for managing all things LittleHorse"
  homepage "https://littlehorse.io/docs/server/developer-guide/lhctl"
  url "https://github.com/littlehorse-enterprises/littlehorse.git", tag: "v0.14.1"
  license "SSPL-1.0"
  head "https://github.com/littlehorse-enterprises/littlehorse.git", tag: "v0.14.1"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=#{version} -X main.commit=homebrew"
    system "go", "build", "-C", "lhctl", *std_go_args(ldflags:)
  end

  test do
    assert_match "Generally a UserTaskRun", shell_output("#{bin}/lhctl --help")
  end
end
