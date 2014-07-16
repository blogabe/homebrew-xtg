require "formula"

class Ytree < Formula
  homepage "http://www.han.de/~werner/ytree.html"
  url "http://www.han.de/~werner/ytree-1.97.tar.gz"
  sha1 "d9f66b41bda7ed28414a56388d0d9fb6ed3975c2"

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
