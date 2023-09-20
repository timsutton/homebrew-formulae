class Speedwagon < Formula
  desc "Download iOS/tvOS/watchOS simulators without Xcode"
  homepage "https://github.com/timsutton/speedwagon"
  url "https://github.com/timsutton/speedwagon.git",
      tag:      "v0.2.0",
      revision: "d32c4edfb847a2a01553b537d782f1b94db28809"
  license "MIT"

  head "https://github.com/timsutton/speedwagon.git", branch: "main"

  stable do
    url "https://github.com/timsutton/speedwagon/releases/download/v0.2.0/speedwagon_0.2.0_darwin_all.zip"
    sha256 "60b2450a4067d6d33fa1821dd26f98a2ab63612d379a23667f1387dbc472c026"
  end

  depends_on "go" => :build

  def install
    if build.head?
      system "go", "build", *std_go_args(ldflags: "-s -w")
    else
      bin.install "speedwagon"
    end
  end

  test do
    out = `#{bin}/speedwagon list`
    out.include?("Simulator")
  end
end
