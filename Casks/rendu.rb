cask "rendu" do
  version "0.4.0"
  sha256 "320a61060209dee08a68552988dcc75668493d3fc06ccf800168d8cc72d17ae1"

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

  zap trash: [
    "~/Library/Caches/com.alleyoop.md-viewer",
    "~/Library/Preferences/com.alleyoop.md-viewer.plist",
  ]
end
