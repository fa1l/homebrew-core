class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool"
  homepage "https://github.com/amacneil/dbmate"
  url "https://github.com/amacneil/dbmate/archive/v1.12.0.tar.gz"
  sha256 "fcb70bfe36f7118336ed191cba78991fcbc3b47f47fc69bb058ae8a9b265e2f1"
  license "MIT"
  head "https://github.com/amacneil/dbmate.git"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "466238443d72e6d0f7bcf0c92a977ee34ca7c1003d0f355aae895725fe12be3a"
    sha256 cellar: :any_skip_relocation, big_sur:       "2ff8a77e409a899dd70559f72a8e8501df068ef6c6f1095f3ac1f28b0122c241"
    sha256 cellar: :any_skip_relocation, catalina:      "5223d60533452d4ddb6d9d140418f74b263fec8ea000cda0f9c1757b4c2dddef"
    sha256 cellar: :any_skip_relocation, mojave:        "547cad2cb3074d94999ddc6e3fc0a4b3000a0e91287bfb5192ce74fe89ca62e4"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s", "-o", bin/"dbmate", "."
  end

  test do
    (testpath/".env").write("DATABASE_URL=sqlite3:test.sqlite3")
    system bin/"dbmate", "create"
    assert_predicate testpath/"test.sqlite3", :exist?, "failed to create test.sqlite3"
  end
end
