cask "rendu" do
  version "0.2.0"
  sha256 :no_check # TODO: リリース後に実際の sha256 に更新

  url "https://github.com/kashioka/Rendu/releases/download/v#{version}/Rendu-macos-aarch64.tar.gz"
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
