class Instill < Formula
    desc "Instill AI's official command-line tool"
    homepage "https://github.com/instill-ai/cli"
    license "Apache-2.0"
    version "v0.1.0-alpha"
    
    if os.Mac?
        url "https://github.com/instill-ai/cli/releases/download/v0.1.0-alpha/instill_0.1.0-alpha_macOS_amd64.tar.gz"
        sha256 "2af62459dc74b53dd656ecd88cbe27b242a95c214f0028e63ecc365a6b3a4577"
    end    

    if OS.linux? && Hardware::CPU.amd_family? && Hardware::CPU.is_64_bit?
        url "https://github.com/instill-ai/cli/releases/download/v0.1.0-alpha/instill_0.1.0-alpha_linux_amd64.tar.gz"
        sha256 "cf9e53c2126224a7fdf09e77cbadbdd26f7905e3a91593295377f1a9730256fb"
    end

    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
        url "https://github.com/instill-ai/cli/releases/download/v0.1.0-alpha/instill_0.1.0-alpha_linux_armv6.tar.gz"
        sha256 "2ae6118913ba02ba42297fddecc91e234acf9daa0c5383c28df9029127cd380f"
    end

    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/instill-ai/cli/releases/download/v0.1.0-alpha/instill_0.1.0-alpha_linux_arm64.tar.gz"
        sha256 "a2dad62afecd853d14095ce8073c59df0b5202bf8d53e223a077b345aebd89bf"
    end    

    def install      
      bin.install "bin/instill"
      (bash_completion/"instill").write `#{bin}/instill completion -s bash`
      (fish_completion/"instill.fish").write `#{bin}/instill completion -s fish`
      (zsh_completion/"_instill").write `#{bin}/instill completion -s zsh`
    end
  
    test do
      assert_match "instill version #{version}", shell_output("#{bin}/instill --version")
    end
  end