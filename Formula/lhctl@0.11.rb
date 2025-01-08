class LhctlAT011 < Formula
desc "LittleHorse CLI for managing all things LittleHorse"
homepage "https://littlehorse.dev/docs/developer-guide/lhctl"
url "https://github.com/littlehorse-enterprises/littlehorse.git",
    tag:      "v0.11.2",
    revision: "fd1ff8340336b411a0f208b9bd4d01fed0d5985f"
license "SSPL-1.0"
head "https://github.com/littlehorse-enterprises/littlehorse.git", tag: "0.11.2"

depends_on "go" => :build

def install
    ldflags = "-X main.version=#{version} -X main.buildSource=homebrew"
    system "go", "build", "-C", "lhctl", *std_go_args(ldflags:)
end

test do
    assert_match "Generally a UserTaskRun", shell_output("#{bin}/lhctl --help")
end
end

