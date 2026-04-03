cask "koe" do
  version "0.4.0"
  
  sha256 "4409255f20ad55abd9d3bd18c8be6da06e753baa8f971077d07381343aa775b3"
  
  url "https://github.com/maemreyo/koe-releases/releases/download/v#{version}/Koe_#{version}_aarch64.dmg",
      verified: "github.com/maemreyo/koe-releases"
  name "Koe"
  desc "Voice-controlled text-to-speech desktop app with global shortcuts and natural voices"
  homepage "https://github.com/maemreyo/zmr-koe"
  
  auto_updates true
  
  app "Koe.app"

  postflight do
    # Bypass Gatekeeper quarantine
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Koe.app"],
                   sudo: false
  end

  uninstall quit: "com.zaobdev.koe"
  
  zap trash: [
    "~/Library/Application Support/com.zaobdev.koe",
    "~/Library/Caches/com.zaobdev.koe",
    "~/Library/Preferences/com.zaobdev.koe.plist",
    "~/Library/Saved Application State/com.zaobdev.koe.savedState",
  ]
end
