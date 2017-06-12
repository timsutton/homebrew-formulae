class BrewPkg < Formula
  desc "Homebrew command for building OS X packages from installed formulae."
  homepage "https://github.com/timsutton/brew-pkg"
  url "https://github.com/timsutton/brew-pkg.git", :tag => "v0.1.6",
                                                   :revision => "ac9e3885c01dca0616fe3cec1530fc153da3271b"

  # This is an .rb that must be executable in order for Homebrew to
  # find it with the 'which' method, so we skip_clean
  skip_clean "bin"

  def install
    bin.install "brew-pkg.rb"
  end
end
