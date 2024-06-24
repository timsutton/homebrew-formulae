class Speedwagon < Formula
  desc "Download iOS/tvOS/watchOS simulators without Xcode"
  homepage "https://github.com/timsutton/speedwagon"
  url "https://github.com/timsutton/speedwagon/releases/download/v0.2.0/speedwagon_0.2.0_darwin_all.zip"
  sha256 "60b2450a4067d6d33fa1821dd26f98a2ab63612d379a23667f1387dbc472c026"
  license "MIT"

  head "https://github.com/timsutton/speedwagon.git", branch: "main"

  depends_on "go" => :build

  def install
    if build.head?
      system "go", "build", *std_go_args(ldflags: "-s -w")
    else
      bin.install "speedwagon"
    end
    generate_completions_from_executable(bin/"speedwagon", "completion")
  end

  test do
    shell_output("#{bin}/speedwagon list").include?("Simulator")
    assert_match version.to_s,
                 shell_output("#{bin}/speedwagon version")
  end
end
