class ApfsCloneChecker < Formula
  desc "Utility to check if two files are clones in macOS APFS"
  homepage "https://github.com/dyorgio/apfs-clone-checker"
  license "MIT"

  head "https://github.com/dyorgio/apfs-clone-checker.git", branch: "main"

  stable do
    url "https://github.com/dyorgio/apfs-clone-checker/releases/download/1.0.0.0/clone_checker-1.0.0.0.zip"
    sha256 "551d0418abf027f29a0561d313365c7fae74ec358023d0ed3a3a3163832c40c0"
  end

  def install
    if build.head?
      system ENV.cc, "clone_checker.c", "-o", "clone_checker"
    else
      bin.install "clone_checker"
    end
  end

  test do
    system "echo data > test_file"
    cp "test_file", "test_file_duplicated"
    # Not using Ruby 'cp' method here because we need the clonefile() syscall from the real 'cp -c'
    system "cp", "-c", "test_file", "test_file_cloned"

    assert_match shell_output("#{bin}/clone_checker test_file test_file_cloned").strip, "1"
    assert_match shell_output("#{bin}/clone_checker test_file test_file_duplicated").strip, "0"
  end
end
