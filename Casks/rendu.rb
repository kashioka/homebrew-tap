cask "rendu" do
  version "0.6.1"
  sha256 "53f349093200bb45bb8ed16ec8ab24fc6e4a9e6b9410b97a33b88cb4adb9664f"

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
