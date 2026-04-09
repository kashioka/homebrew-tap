cask "rendu" do
  version "0.3.0"
  sha256 "7417c21653de72d992844b9a21d47d93cf68c5cd80af1cfe9e844b1162ca71e6"

  url "https://github.com/kashioka/Rendu/releases/download/v#{version}/Rendu_#{version}_aarch64.dmg"
  name "Rendu"
  desc "Lightweight desktop Markdown viewer"
  homepage "https://github.com/kashioka/Rendu"

  depends_on arch: :arm64

  app "Rendu.app"

  zap trash: [
    "~/Library/Caches/com.alleyoop.md-viewer",
    "~/Library/Preferences/com.alleyoop.md-viewer.plist",
  ]
end
