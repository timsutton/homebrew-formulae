class Speedwagon < Formula
  desc "Download iOS/tvOS/watchOS simulators without Xcode"
  homepage "https://github.com/timsutton/speedwagon"
  url "https://github.com/timsutton/speedwagon.git",
      tag:      "v0.1.0",
      revision: "60cd66c367a26918d894c37897899e1b0f7b8e7f"
  license "MIT"
  head "https://github.com/timsutton/speedwagon.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    out = `#{bin}/speedwagon list`
    out.include?("Simulator")
  end
end
