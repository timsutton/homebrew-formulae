class BrewPkg < Formula
  desc "Homebrew command for building OS X packages from installed formulae"
  homepage "https://github.com/timsutton/brew-pkg"
  url "https://github.com/timsutton/brew-pkg.git", tag:      "v0.1.8",
                                                   revision: "a5566913e13011a094017a62eea50a6280445041"

  head "https://github.com/timsutton/brew-pkg.git", branch: "master"

  # This is an .rb that must be executable in order for Homebrew to
  # find it with the 'which' method, so we skip_clean
  skip_clean "bin"

  def install
    bin.install "brew-pkg.rb"
  end

  test do
    system "brew", "pkg", "jq"
    output_pkg = Dir.glob("*.pkg").first
    system "pkgutil", "--expand", output_pkg, "extract"
    assert_match "org.homebrew.jq", File.read("extract/PackageInfo")
    rm_rf "extract"

    # --identifier-prefix fag handling seems broken, otherwise we'd test this
    # system "brew", "pkg", "--identifier-prefix=foo.bar", "jq"
    # system "pkgutil", "--expand", output_pkg, "extract"
    # assert_match "foo.bar.jq", File.read("extract/PackageInfo")
  end
end
