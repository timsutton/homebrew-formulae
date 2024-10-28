class Pngout < Formula
  desc "Binary OS X port of Ken Silverman's PNGOUT by Jonathon Fowler"
  homepage "https://www.jonof.id.au/kenutils.html"
  url "https://www.jonof.id.au/files/kenutils/pngout-20230322-mac.zip"
  sha256 "2e3eb79345206040ae3a0d0d0ecfe9ad01d92fe5002b8a1676a65632a56840e1"

  def install
    bin.install "pngout"
  end

  test do
    system bin/"pngout", "-force", test_fixtures("test.png"), "out.png"
  end
end
