class Ytree < Formula
  desc "Curses-based file manager similar to DOS XTree"
  homepage "https://www.han.de/~werner/ytree.html"
  url "https://www.han.de/~werner/ytree-2.13.tar.gz"
  sha256 "caeeeac334dac83921bd8b657ad2d4cf234c15da4ffc7d15dad0bda99e52f197"
  license "GPL-2.0-or-later"

  def install
    system "make", "install",
           "DESTDIR=#{prefix}",
           "CFLAGS=-DCOLOR_SUPPORT -DNCURSES",
           "LDFLAGS=-lncurses"
    (share/"ytree").install "ytree.conf"
  end
end
