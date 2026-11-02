cask "maclens" do
  version "1.8.0"
  sha256 "d01d4cfdb65f29c6af17a7ef05ca23ca1db915b315629341fe604c6797fe6908"

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
