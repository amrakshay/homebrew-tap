cask "maclens" do
  version "1.2.0"
  sha256 "e8c4be05dd9e0b154b051cd6ff47dcf439e0b1ec44a0a3caf611ccbdf2bcee6a"

  url "https://github.com/amrakshay/maclens/releases/download/v#{version}/MacLens-#{version}.zip"
  name "MacLens"
  desc "Developer-focused monitor for heat, battery drain, ports and build artifacts"
  homepage "https://github.com/amrakshay/maclens"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "MacLens.app"

  zap trash: [
    "~/Library/Caches/dev.maclens",
    "~/Library/Preferences/dev.maclens.MacLens.plist",
  ]

  caveats <<~EOS
    MacLens is free and not notarized by Apple, so macOS blocks the first launch:
      1. Open MacLens once (it will be blocked).
      2. System Settings → Privacy & Security → "MacLens was blocked…" → Open Anyway.
  EOS
end
