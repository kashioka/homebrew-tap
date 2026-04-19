cask "rendu" do
  version "0.6.0"
  sha256 "18b1c3bd4a9b72a05a288dff0240bf0bfd073a86104e4fa1927e6ea442532a94"

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
