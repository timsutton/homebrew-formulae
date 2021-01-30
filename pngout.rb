class Pngout < Formula
  desc "Binary OS X port of Ken Silverman's PNGOUT by Jonathon Fowler"
  homepage "https://www.jonof.id.au/kenutils.html"
  url "https://www.jonof.id.au/files/kenutils/pngout-20200115-macos.zip"
  sha256 "3272fa947eeafc1ac0086e1f14935f9efa21d090a555e6892255fe5c88f6686e"

  bottle :unneeded

  def install
    bin.install "pngout"
  end
end
