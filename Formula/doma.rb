# typed: strict
# frozen_string_literal: true

# This file is rendered by doma's release pipeline (.github/workflows/publish-homebrew.yml).
# DO NOT EDIT by hand.
class Doma < Formula
  desc "Directory tag manager - put your directories on the cutting board"
  homepage "https://github.com/hahwul/doma"
  version "0.2.1"
  license "MIT"

  # doma ships prebuilt binaries: Linux is statically linked (musl) and macOS
  # links only system libraries (system libsqlite3) plus statically linked
  # Crystal runtime libs, so the formula declares no dependencies. An otool
  # guard in release-binary.yml enforces that no Homebrew dylib leaks in.
  on_macos do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.2.1/doma-v0.2.1-osx-arm64"
      sha256 "6a5d3026784fa101ce7191ce896774bacd3fc615140cac4412a92f6babd90dac"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.2.1/doma-v0.2.1-osx-x86_64"
      sha256 "e426c15d7afac027f0b531c4c83fb09be9db9c038c43d279b4c409a11964d4c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.2.1/doma-v0.2.1-linux-arm64"
      sha256 "8c8de4152900f48f4719782e4c2e1e62ea104638f2773c1b754ad67c21a68ad4"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.2.1/doma-v0.2.1-linux-x86_64"
      sha256 "1c7e25c39ef4c99e34148d97c29705bd491e808445551e3b181900342430cc81"
    end
  end

  def install
    bin.install Dir["doma-v0.2.1-*"].first => "doma"
  end

  test do
    system "#{bin}/doma", "version"
  end
end
