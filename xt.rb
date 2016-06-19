class Xt < Formula
  desc "UnixTree, formerly known as \"xtree for UNIX Systems\", now is a powerful, XTree-alike filemanager for Unix/Linux"
  homepage "http://www.unixtree.org/"
  url "https://downloads.sourceforge.net/project/unixtree/unixtree/3.0.2/xt-source-3.0.2.tar.gz"
  sha256 "7d131012429212e870911bbae741ae8552901319aad8bad16330432548882b44"

  def install
    ENV.deparallelize
    ENV.no_optimization
    ENV.append "INS_DIR", "#{buildpath}/hb-pkg"
    system "bash -c 'source build -r osx && /bin/bash make install'"

    cd "#{buildpath}/hb-pkg"
    prefix.install "FILES", "FILES-UTILS", "INSTALL", "TERMFILES"
    bin.install "dispblks", "dispbox", "dispchrs", "dispclrs", "dispkeys", "dispsnap", "dispterm", "dumpterm", "pcxterm", "playback", "restool", "saveterm", "termput", "xt", "xtx"
    share.install "man", "catman"
    (share/"xt").install "trm", "english.hlp", "english.res", "german.hlp", "german.res", "magic", "sample.rc", "xt.fc", "xt.mnu"
  end
end
