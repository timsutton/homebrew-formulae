class Pngout < Formula
  # In my tap because of:
  # https://github.com/Homebrew/homebrew-binary/issues/286
  desc "Binary OS X port of Ken Silverman's PNGOUT by Jonathon Fowler."
  homepage "http://www.jonof.id.au/kenutils"
  url "http://static.jonof.id.au/dl/kenutils/pngout-20150920-darwin.tar.gz"
  sha256 "f3fdd1e2c3f1f1fa886b3b302d64e5e9285cf917ddd43dfd75fb3ff156b66442"

  bottle :unneeded

  def install
    bin.install "pngout"
  end
end
