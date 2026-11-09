# typed: strict
# frozen_string_literal: true

# This file is rendered by doma's release pipeline (.github/workflows/publish-homebrew.yml).
# DO NOT EDIT by hand.
class Doma < Formula
  desc "Directory tag manager - put your directories on the cutting board"
  homepage "https://github.com/hahwul/doma"
  version "0.5.0"
  license "MIT"

  # doma ships prebuilt binaries: Linux is statically linked (musl) and macOS
  # links only system libraries (system libsqlite3) plus statically linked
  # Crystal runtime libs, so the formula declares no dependencies. An otool
  # guard in release-binary.yml enforces that no Homebrew dylib leaks in.
  on_macos do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.5.0/doma-v0.5.0-osx-arm64"
      sha256 "d5b2df777a26e7357a93d29c921a0be0e204584c161ca82a60baf6696254ed5b"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.5.0/doma-v0.5.0-osx-x86_64"
      sha256 "4a42a8fe521095abe9ebdf2bec3fcbb9725845a72c1aac6f6cae21e08200059a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hahwul/doma/releases/download/v0.5.0/doma-v0.5.0-linux-arm64"
      sha256 "bcab663a41073bd5ef4ab3e2b9b3700e86fcf72825a41fc4175caec16f198a02"
    end
    on_intel do
      url "https://github.com/hahwul/doma/releases/download/v0.5.0/doma-v0.5.0-linux-x86_64"
      sha256 "06ad4bdb80e3161c45f9e2a53fa35e454898af501a2beab480ffd34afd0329bb"
    end
  end

  def install
    bin.install Dir["doma-v0.5.0-*"].first => "doma"
  end

  test do
    system "#{bin}/doma", "version"
  end
end
