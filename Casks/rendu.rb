cask "rendu" do
  version "0.5.2"
  sha256 "9bdcb6805a72c855d0883ff67f2af1d84baf013feb9475eda3de497f6f7236ec"

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
