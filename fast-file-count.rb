class FastFileCount < Formula
  desc "Program to quickly count files in a subdirectory"
  homepage "https://github.com/ChristopherSchultz/fast-file-count"
  version "82079c0a6ab0d132c81c611cd2bf61e5a8d04028"
  sha256 "25003cd5b6cf0e475cad5115c94dce3339bf69760af29ba357f36de5af5b5b72"
  license "Apache-2.0"
  head "https://github.com/ChristopherSchultz/fast-file-count.git", branch: "main"

  def install
    Dir.chdir buildpath do
      system ENV.cc, "-Wall", "-pedantic", "-o", "dircnt", "dircnt.c"
      bin.install "./dircnt"
    end
  end

  test do
    testdir = "foo"
    mkdir_p "#{testdir}/dir"
    touch "#{testdir}/file"
    assert_equal "foo contains 1 files and 1 directories", shell_output("#{bin}/dircnt #{testdir}").strip
  end
end
