# typed: strict
# frozen_string_literal: true

# This file is rendered by doma's release pipeline (.github/workflows/publish-homebrew.yml).
# DO NOT EDIT by hand.
class Doma < Formula
  desc "Directory tag manager - put your directories on the cutting board"
  homepage "https://github.com/hahwul/doma"
  version "0.4.1"
  license "MIT"

  # doma ships prebuilt binaries: Linux is statically linked (musl) and macOS
  # links only system libraries (system libsqlite3) plus statically linked
  # Crystal runtime libs, so the formula declares no dependencies. An otool
  # guard in release-binary.yml enforces that no Homebrew dylib leaks in.
  on_macos do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.4.1/doma-v0.4.1-osx-arm64"
      sha256 "e96867110f520b872dfbf56ec28bff015bdb94df0912b6dd768c84052fec37ca"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.4.1/doma-v0.4.1-osx-x86_64"
      sha256 "7bec44ae308977b1d07a1d944585a78a19f447ce8f8adc99f357393d4081e467"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.4.1/doma-v0.4.1-linux-arm64"
      sha256 "ebae93c5eb0d3d71900e8945fee7c908648abff9559fdc52a05970f49733ebd9"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.4.1/doma-v0.4.1-linux-x86_64"
      sha256 "676a02c61fb145568bb2b621129b342a963fa84a6772d6f68c1159b5f802721c"
    end
  end

  def install
    bin.install Dir["doma-v0.4.1-*"].first => "doma"
  end

  test do
    system "#{bin}/doma", "version"
  end
end
