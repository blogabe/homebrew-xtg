class Xt < Formula
  desc "XTree-alike file manager for Unix systems"
  homepage "https://github.com/dokakod/unixtree"
  url "https://github.com/dokakod/unixtree/archive/refs/tags/v3.0.4.tar.gz"
  sha256 "be5f39f66cca83d4691c72203c093968a6ccf8eab46ab3bf39c833cc8f48fd1c"
  license "GPL-2.0-only"
  revision 1

  def install
    ENV.deparallelize
    ENV["INS_DIR"] = "#{buildpath}/hb-pkg"
    # Fix missing return type rejected by C99 and later
    inreplace "libres/resmkch.c",
              "static res_get_list (RES_LIST *rl, char *msgbuf)",
              "static int res_get_list (RES_LIST *rl, char *msgbuf)"
    system "bash", "-c", "source build -r osx && /bin/bash make install"

    cd "#{buildpath}/hb-pkg" do
      prefix.install "FILES", "FILES-UTILS", "INSTALL", "TERMFILES"
      executables = %w[
        dispblks dispbox dispchrs dispclrs dispkeys dispsnap dispterm dumpterm
        pcxterm playback restool saveterm termput xt xtx
      ]
      # UnixTree looks for its runtime files beside the actual executable.
      libexec.install executables
      bin.write_exec_script executables.map { |executable| libexec/executable }
      share.install "man", "catman"
      libexec.install "trm", "english.hlp", "english.res", "german.hlp", "german.res",
                      "magic", "sample.rc", "xt.fc", "xt.mnu"
    end
  end
end
