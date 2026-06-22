cask "rendu" do
  version "0.9.0"
  sha256 "056bd0357dcc2190a0b81a63b6448be08dd1667684b0e24cbb3954b586a48958"

  url "https://github.com/kashioka/Rendu/releases/download/v#{version}/Rendu_#{version}_aarch64.dmg"
  name "Rendu"
  desc "Lightweight desktop Markdown viewer"
  homepage "https://github.com/kashioka/Rendu"

  depends_on arch: :arm64

  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/Rendu.app"]
  end

  app "Rendu.app"
  binary "#{appdir}/Rendu.app/Contents/Resources/resources/rendu-cli", target: "rendu"

  zap trash: [
    "~/Library/Caches/com.alleyoop.md-viewer",
    "~/Library/Preferences/com.alleyoop.md-viewer.plist",
  ]
end
