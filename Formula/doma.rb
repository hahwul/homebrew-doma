# typed: strict
# frozen_string_literal: true

# This file is rendered by doma's release pipeline (.github/workflows/publish-homebrew.yml).
# DO NOT EDIT by hand.
class Doma < Formula
  desc "Directory tag manager - put your directories on the cutting board"
  homepage "https://github.com/hahwul/doma"
  version "0.6.0"
  license "MIT"

  # doma ships prebuilt binaries: Linux is statically linked (musl) and macOS
  # links only system libraries (system libsqlite3) plus statically linked
  # Crystal runtime libs, so the formula declares no dependencies. An otool
  # guard in release-binary.yml enforces that no Homebrew dylib leaks in.
  on_macos do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.6.0/doma-v0.6.0-osx-arm64"
      sha256 "ddc8a4f632b997ff234b5d72dabb9a57015c8d95a893249b4f12db06490cc134"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.6.0/doma-v0.6.0-osx-x86_64"
      sha256 "a684ccdcda331cb9f242a7afe79d765edd3ed496f6eb852d8af4837c61af36ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.6.0/doma-v0.6.0-linux-arm64"
      sha256 "e037e7ec2627a81e4875c081fef6438b9a41434ddb6914a164b99b3885b67b7b"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.6.0/doma-v0.6.0-linux-x86_64"
      sha256 "24b10ebba0e1070ae355feebd412ba40f2b288ad6b446c745221f02a71f76646"
    end
  end

  def install
    bin.install Dir["doma-v0.6.0-*"].first => "doma"
  end

  test do
    system "#{bin}/doma", "version"
  end
end
