cask "xaea" do
  version "0.2.0"
  sha256 "dceb8fb8d31e868564572ae4eaf32a33bacf487bebff16bf5fff3810352ca516"

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
