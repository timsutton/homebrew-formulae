class BrewPkg < Formula
  desc "Homebrew command for building OS X packages from installed formulae"
  homepage "https://github.com/timsutton/brew-pkg"
  url "https://github.com/timsutton/brew-pkg.git", tag:      "v0.1.8",
                                                   revision: "a5566913e13011a094017a62eea50a6280445041"

  head do
    url "https://github.com/timsutton/brew-pkg.git", branch: "master"
  end

  # This is an .rb that must be executable in order for Homebrew to
  # find it with the 'which' method, so we skip_clean
  skip_clean "bin"

  def install
    bin.install "brew-pkg.rb"
  end
end
