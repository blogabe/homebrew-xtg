class Ytree < Formula
  desc "Ytree; a UNIX Filemanager - a (curses-based) file manager similar to DOS Xtree(tm)"
  homepage "http://www.han.de/~werner/ytree.html"
  url "https://www.han.de/~werner/ytree-2.00.tar.gz"
  sha256 "da8ecaf8e15f8b0d3077ea88da8db9cd607f72ed2a51e91a24d6ef3ff017c6bf"

  def install
    mkpath "#{buildpath}/hb-pkg/bin"
    mkpath "#{buildpath}/hb-pkg/share/man/man1"
    mkpath "#{buildpath}/hb-pkg/share/man/es/man1"
    inreplace "Makefile" do |s|
      s.gsub! "DESTDIR     = /usr", "DESTDIR     = #{buildpath}/hb-pkg"
      s.gsub! "COLOR       = -DCOLOR_SUPPORT", "#COLOR       = -DCOLOR_SUPPORT"
      s.gsub! "READLINE    = -DREADLINE_SUPPORT", "#READLINE    = -DREADLINE_SUPPORT"
      s.gsub! "CFLAGS      += -D_GNU_SOURCE $(COLOR) $(CLOCK) $(READLINE) $(ADD_CFLAGS)", "#CFLAGS      += -D_GNU_SOURCE $(COLOR) $(CLOCK) $(READLINE) $(ADD_CFLAGS)"
      s.gsub! "LDFLAGS     += -lncurses -lreadline", "#LDFLAGS     += -lncurses -lreadline"
      s.gsub! "#CFLAGS      = -DCOLOR_SUPPORT -DNCURSES", "CFLAGS      = -DCOLOR_SUPPORT -DNCURSES"
      s.gsub! "#LDFLAGS     = -lncurses", "LDFLAGS     = -lncurses"
    end
    system "make", "install"

    cd "#{buildpath}/hb-pkg"
    prefix.install "bin", "share"
    (share/"ytree").install "#{buildpath}/ytree.conf"
  end
end
