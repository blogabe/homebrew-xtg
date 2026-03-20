class Ytree < Formula
  desc "Curses-based file manager similar to DOS XTree"
  homepage "https://www.han.de/~werner/ytree.html"
  url "https://www.han.de/~werner/ytree-2.10.tar.gz"
  sha256 "3bbbbd32f568cdae3e03fc735b1783d8cba605a2ca6056d1b971143d7ddd517d"
  license "GPL-2.0-or-later"

  def install
    system "make", "install",
           "DESTDIR=#{prefix}",
           "CFLAGS=-DCOLOR_SUPPORT -DNCURSES",
           "LDFLAGS=-lncurses"
    (share/"ytree").install "ytree.conf"
  end
end
