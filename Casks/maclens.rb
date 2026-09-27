cask "maclens" do
  version "1.0.0"
  sha256 "28e3c5f839bbf8d370105fe6287ee76e0f67ed04b2fed97220c0477e17a630a5"

  url "https://github.com/amrakshay/maclens/releases/download/v#{version}/MacLens-#{version}.zip"
  name "MacLens"
  desc "Developer-focused monitor for heat, battery drain, ports and build artifacts"
  homepage "https://github.com/amrakshay/maclens"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

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
