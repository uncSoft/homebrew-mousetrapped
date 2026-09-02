cask "mousetrapped" do
  version "1.0.2"
  sha256 "c9d15883c65f68cf773cebcce139fc21cfb4f2f5c89b25364b1eb8bdf6044aa6"

  url "https://github.com/uncSoft/Mousetrapped/releases/download/v#{version}/Mousetrapped-#{version}.zip"
  name "Mousetrapped"
  desc "Menu bar panic button that rescues a trapped, hidden, or lost mouse cursor"
  homepage "https://github.com/uncSoft/Mousetrapped"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Built against macOS 13 (Ventura), the app's LSMinimumSystemVersion.
  depends_on macos: ">= :ventura"

  app "Mousetrapped.app"

  # Preferences (hotkey, sensitivity, rescue counter) and the opt-in
  # debug log. Listed for `brew uninstall --zap` so users who want a
  # true uninstall get one. The Input Monitoring grant is removed by
  # the user in System Settings; Homebrew can't touch TCC.
  zap trash: [
    "~/Library/Preferences/dev.mousetrapped.Mousetrapped.plist",
    "~/Library/Logs/Mousetrapped.log",
  ]
end
