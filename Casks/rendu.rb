cask "rendu" do
  version "0.7.1"
  sha256 "11ad876f2ad9fcbaf0ebf4f326633db4b9d5d6419d57a910405a7c82c2f08085"

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
