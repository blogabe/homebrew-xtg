class Ytree < Formula
  desc "Curses-based file manager similar to DOS XTree"
  homepage "https://www.han.de/~werner/ytree.html"
  url "https://www.han.de/~werner/ytree-2.10.tar.gz"
  sha256 "3bbbbd32f568cdae3e03fc735b1783d8cba605a2ca6056d1b971143d7ddd517d"
  license "GPL-2.0-or-later"

  def install
    inreplace "Makefile" do |s|
      s.gsub! "DESTDIR     = /usr", "DESTDIR     = #{prefix}"
      s.gsub! "COLOR       = -DCOLOR_SUPPORT", "#COLOR       = -DCOLOR_SUPPORT"
      s.gsub! "READLINE    = -DREADLINE_SUPPORT", "#READLINE    = -DREADLINE_SUPPORT"
      s.gsub! "CFLAGS      += -D_GNU_SOURCE $(COLOR) $(CLOCK) $(READLINE) $(ADD_CFLAGS)",
              "#CFLAGS      += -D_GNU_SOURCE $(COLOR) $(CLOCK) $(READLINE) $(ADD_CFLAGS)"
      s.gsub! "LDFLAGS     += -lncurses -lreadline", "#LDFLAGS     += -lncurses -lreadline"
      s.gsub! "#CFLAGS      = -DCOLOR_SUPPORT -DNCURSES", "CFLAGS      = -DCOLOR_SUPPORT -DNCURSES"
      s.gsub! "#LDFLAGS     = -lncurses", "LDFLAGS     = -lncurses"
    end
    system "make", "install"
    (share/"ytree").install "ytree.conf"
  end
end
