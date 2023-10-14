# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Inst < Formula
  desc "Instill AI's command-line tool"
  homepage "https://github.com/instill-ai/cli"
  version "0.1.0-alpha"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/instill-ai/cli/releases/download/v0.1.0-alpha/inst_Darwin_x86_64.tar.gz"
    sha256 "a949a6d5ffba07eeb11c1b58455334494c258ec7e4e7060db373646be8e48497"

    def install
      bin.install "bin/inst"
      (bash_completion/"inst").write `#{bin}/inst completion -s bash`
      (fish_completion/"inst.fish").write `#{bin}/inst completion -s fish`
      (zsh_completion/"_inst").write `#{bin}/inst completion -s zsh`
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the Inst
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/instill-ai/cli/releases/download/v0.1.0-alpha/inst_Linux_x86_64.tar.gz"
      sha256 "8b9cd01411795a3d0279a628baaa367c75245a76b74e539f0e638811540ad0db"

      def install
        bin.install "bin/inst"
        (bash_completion/"inst").write `#{bin}/inst completion -s bash`
        (fish_completion/"inst.fish").write `#{bin}/inst completion -s fish`
        (zsh_completion/"_inst").write `#{bin}/inst completion -s zsh`
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/instill-ai/cli/releases/download/v0.1.0-alpha/inst_Linux_arm64.tar.gz"
      sha256 "6f9de367e28270373df13a995e4e2f3dc3fd6676145472ff1098812ff80ca04d"

      def install
        bin.install "bin/inst"
        (bash_completion/"inst").write `#{bin}/inst completion -s bash`
        (fish_completion/"inst.fish").write `#{bin}/inst completion -s fish`
        (zsh_completion/"_inst").write `#{bin}/inst completion -s zsh`
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/instill-ai/cli/releases/download/v0.1.0-alpha/inst_Linux_armv6.tar.gz"
      sha256 "0524f2eff52bebc7a23fd4af0d9fe0865c371371e2abcdfbacff8aa35e0fecee"

      def install
        bin.install "bin/inst"
        (bash_completion/"inst").write `#{bin}/inst completion -s bash`
        (fish_completion/"inst.fish").write `#{bin}/inst completion -s fish`
        (zsh_completion/"_inst").write `#{bin}/inst completion -s zsh`
      end
    end
  end

  test do
    assert_match "inst version #{version}", shell_output("#{bin}/inst --version")
  end
end
