class Xt < Formula
  desc "XTree-alike file manager for Unix systems"
  homepage "https://github.com/dokakod/unixtree"
  url "https://github.com/dokakod/unixtree/archive/refs/tags/v3.0.4.tar.gz"
  sha256 "be5f39f66cca83d4691c72203c093968a6ccf8eab46ab3bf39c833cc8f48fd1c"
  license "GPL-2.0-only"

  def install
    ENV.deparallelize
    ENV["INS_DIR"] = "#{buildpath}/hb-pkg"
    system "bash", "-c", "source build -r osx && /bin/bash make install"

    cd "#{buildpath}/hb-pkg" do
      prefix.install "FILES", "FILES-UTILS", "INSTALL", "TERMFILES"
      bin.install "dispblks", "dispbox", "dispchrs", "dispclrs", "dispkeys", "dispsnap",
                  "dispterm", "dumpterm", "pcxterm", "playback", "restool", "saveterm",
                  "termput", "xt", "xtx"
      share.install "man", "catman"
      (share/"xt").install "trm", "english.hlp", "english.res", "german.hlp", "german.res",
                           "magic", "sample.rc", "xt.fc", "xt.mnu"
    end
  end
end
