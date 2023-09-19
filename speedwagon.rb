class Speedwagon < Formula
  desc "Download iOS/tvOS/watchOS simulators without Xcode"
  homepage "https://github.com/timsutton/speedwagon"
  url "https://github.com/timsutton/speedwagon.git",
      tag:      "v0.2.0",
      revision: "d32c4edfb847a2a01553b537d782f1b94db28809"
  license "MIT"

  head "https://github.com/timsutton/speedwagon.git", branch: "main"

  stable do
    url "https://github.com/timsutton/speedwagon/releases/download/v0.2.0/speedwagon_0.2.0_darwin_all.tar.gz"
    sha256 "eeea97d399edc1b3983adab16a7ead1c3dd3fdb99018699f92de4993337b5834"
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
