cask "xaea" do
  version "0.2.1"
  sha256 "0caa799e63b9058edfed38aafcb28795f5ee7b3fd13e1a787fbea9827d1a3a07"

  url "https://github.com/timsutton/xaea/releases/download/v#{version}/xaea_#{version}_darwin_universal.tar.gz"
  name "xaea"
  desc "Extract Xcode AEA archives fast"
  homepage "https://github.com/timsutton/xaea"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  binary "xaea"
  generate_completions_from_executable "bin/xaea", "completions"
end
