require "formula"

class Xt < Formula
  homepage "http://www.unixtree.org/"
  url "https://downloads.sourceforge.net/project/unixtree/unixtree/3.0.2/xt-source-3.0.2.tar.gz"
  sha1 "67ecd2a6b8b02c1f07ef76c7e58c26f18e061904"

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
