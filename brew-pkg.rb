class BrewPkg < Formula
  desc "Homebrew command for building OS X packages from installed formulae."
  homepage "https://github.com/timsutton/brew-pkg"
  url "https://github.com/timsutton/brew-pkg.git", :tag => "v0.1.5",
                                                   :revision => "5b630de615c46c3c419de34fccfeedafcb0c7fd5"

  # This is an .rb that must be executable in order for Homebrew to
  # find it with the 'which' method, so we skip_clean
  skip_clean "bin"

  def install
    bin.install "brew-pkg.rb"
  end
end
