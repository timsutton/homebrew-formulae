class Smctemp < Formula
  desc "CLI tool to print CPU and GPU temperature of macOS"
  homepage "https://github.com/narugit/smctemp"
  url "https://github.com/narugit/smctemp/archive/refs/tags/0.5.0.tar.gz"
  sha256 "a4e47ce683989eb4e0ad5fd5622c3c71bba7c14a1739d4f28618928b0c3dbdc0"
  license "GPL-2.0-only"
  head "https://github.com/narugit/smctemp.git", branch: "main"

  def install
    Dir.chdir buildpath do
      system "make", "smctemp"
      bin.install "./smctemp"
    end
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/smctemp -v").strip
    current_temp = shell_output("#{bin}/smctemp -c").strip
    assert_equal true, current_temp.to_f > 20
    assert_equal true, current_temp.to_f < 100
  end
end
