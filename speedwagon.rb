class Speedwagon < Formula
  desc "Download iOS/tvOS/watchOS simulators without Xcode"
  homepage "https://github.com/timsutton/speedwagon"
  url "https://github.com/timsutton/speedwagon.git",
      tag:      "v0.2.0",
      revision: "d32c4edfb847a2a01553b537d782f1b94db28809"
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
