# typed: strict
# frozen_string_literal: true

# This file is rendered by doma's release pipeline (.github/workflows/publish-homebrew.yml).
# DO NOT EDIT by hand.
class Doma < Formula
  desc "Directory tag manager - put your directories on the cutting board"
  homepage "https://github.com/hahwul/doma"
  version "0.3.0"
  license "MIT"

  # doma ships prebuilt binaries: Linux is statically linked (musl) and macOS
  # links only system libraries (system libsqlite3) plus statically linked
  # Crystal runtime libs, so the formula declares no dependencies. An otool
  # guard in release-binary.yml enforces that no Homebrew dylib leaks in.
  on_macos do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.3.0/doma-v0.3.0-osx-arm64"
      sha256 "df0e0817d0eca4984e62ddec2cbcbedbd12da323a5e6915401e9bfb7afb14ca2"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.3.0/doma-v0.3.0-osx-x86_64"
      sha256 "2839d53c3f5852c88b0aa7a5459efb58ba4e9bb49071a0da82f4f917c26d4355"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.3.0/doma-v0.3.0-linux-arm64"
      sha256 "b1cd1a36395bf7117c89061dd51cdf689a66ae7a5ba938798268b1816c720a79"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.3.0/doma-v0.3.0-linux-x86_64"
      sha256 "4944ac849cf5f12d3178c002d2f373a157baefa6f08bee4529cf8a0a8ebda592"
    end
  end

  def install
    bin.install Dir["doma-v0.3.0-*"].first => "doma"
  end

  test do
    system "#{bin}/doma", "version"
  end
end
