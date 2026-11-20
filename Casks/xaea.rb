cask "xaea" do
  version "0.1.3"
  sha256 "046236481c44107b8f02719f6b3ace08c230e9dad7ed1ee9ec343f0543121495"

  url "https://github.com/timsutton/xaea/releases/download/v#{version}/xaea_#{version}_darwin_universal.tar.gz"
  name "xaea"
  desc "Fast extractor for Apple Encrypted Archives (Xcode edition)"
  homepage "https://github.com/timsutton/xaea"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  binary "xaea"
end
