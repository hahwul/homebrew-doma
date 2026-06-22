# typed: strict
# frozen_string_literal: true

# This file is rendered by doma's release pipeline (.github/workflows/publish-homebrew.yml).
# DO NOT EDIT by hand.
class Doma < Formula
  desc "Directory tag manager - put your directories on the cutting board"
  homepage "https://github.com/hahwul/doma"
  version "0.4.0"
  license "MIT"

  # doma ships prebuilt binaries: Linux is statically linked (musl) and macOS
  # links only system libraries (system libsqlite3) plus statically linked
  # Crystal runtime libs, so the formula declares no dependencies. An otool
  # guard in release-binary.yml enforces that no Homebrew dylib leaks in.
  on_macos do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.4.0/doma-v0.4.0-osx-arm64"
      sha256 "d5fa53b953e6aa7a1dfe47cc659c0f952371a0503292acdde233b2bcbcb893f7"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.4.0/doma-v0.4.0-osx-x86_64"
      sha256 "1fd0a4ec0f8274ae91898b4462b4b413725ec6bee322010c9676c37a86706909"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.4.0/doma-v0.4.0-linux-arm64"
      sha256 "334df6647b9a24d02541b6846c248c97ee016f3ec9444a8bce713f8e76505e32"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.4.0/doma-v0.4.0-linux-x86_64"
      sha256 "aaefba0880fa721a652a8bcce8b9fe28f9d807bf8b63f7eda341856c26ce6882"
    end
  end

  def install
    bin.install Dir["doma-v0.4.0-*"].first => "doma"
  end

  test do
    system "#{bin}/doma", "version"
  end
end
