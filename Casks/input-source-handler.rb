cask "input-source-handler" do
  version "0.2.0"
  sha256 "e87b051c8376cf2b134d5060c7d90a05d41f08d48c53becb42d7a0acff5fa1e4"

  url "https://github.com/yuyuyuyuyu-dev/input-source-handler/releases/download/v#{version}/InputSourceHandler.zip"
  name "Input Source Handler"
  desc "Utility for switching input sources with custom keyboard shortcuts"
  homepage "https://github.com/yuyuyuyuyu-dev/input-source-handler#readme"

  depends_on macos: :tahoe

  app "InputSourceHandler.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/InputSourceHandler.app"],
                   sudo: true
  end

  caveats <<~EOS
    This app requires sudo (administrator) privileges to remove the quarantine attribute.
    This is necessary to prevent macOS Gatekeeper from showing the "app is damaged" error,
    since the app is currently not signed or notarized by Apple.
    You will be prompted for your password during the installation process.
  EOS
end
