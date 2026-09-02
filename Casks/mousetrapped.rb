cask "mousetrapped" do
  version "1.0.1"
  sha256 "bd200fb3d6475b32efac8a839369559bff86214f41bc06045bcb36ddbe423b41"

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
