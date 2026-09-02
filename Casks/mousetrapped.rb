cask "mousetrapped" do
  version "1.0.4"
  sha256 "ef14dd86ef885e1158afe68aa421be32a2b10117f06be99e175b208916df37a9"

  url "https://github.com/uncSoft/Mousetrapped/releases/download/v#{version}/Mousetrapped-#{version}.zip"
  name "Mousetrapped"
  desc "Menu bar panic button that rescues a trapped, hidden, or lost mouse cursor"
  homepage "https://github.com/uncSoft/Mousetrapped"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Built against macOS 13 (Ventura), the app's LSMinimumSystemVersion.
  depends_on macos: :ventura

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
