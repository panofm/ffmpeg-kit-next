// swift-tools-version:5.9
//
// Prebuilt iOS xcframeworks for panofm, hosted on this fork's releases.
//
// Upstream ffmpeg-kit-next publishes no binaries — it is built from source with
// Nix or ios.sh — and a full ffmpeg cross-build in front of every `ios:install`
// is not a thing anyone should pay for. So the build is done once, uploaded to
// a release here, and referenced by URL and checksum.
//
// Built from upstream v9.0.0 with:
//
//     ./ios.sh --arch=arm64,arm64-simulator --enable-lib-ios-audiotoolbox -x --spm --speed
//
// No external libraries beyond Apple's AudioToolbox. The voice path needs
// `loudnorm` and `ebur128`, which are built-in libavfilter filters and pull in
// nothing extra.
//
// LGPL-3.0, as upstream. Rebuild and re-tag rather than editing a checksum:
// a binaryTarget whose checksum was hand-edited is a binary nobody verified.
import PackageDescription

let package = Package(
    name: "ffmpeg-kit",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ffmpeg-kit",
            targets: [
                "ffmpegkit", "libavcodec", "libavdevice", "libavfilter",
                "libavformat", "libavutil", "libswresample", "libswscale",
            ]
        )
    ],
    targets: [
        .binaryTarget(
            name: "ffmpegkit",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.2/ffmpegkit.xcframework.zip",
            checksum: "7a3c0e781557311f5559d21be8032814c330da75630ae6b5a50dd69e435387e5"
        ),
        .binaryTarget(
            name: "libavcodec",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.2/libavcodec.xcframework.zip",
            checksum: "b7e5d7f8672db218383a5e063f0b5240c1cbca74de52b12752dcdb83d8041bf3"
        ),
        .binaryTarget(
            name: "libavdevice",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.2/libavdevice.xcframework.zip",
            checksum: "f5f68edfc5c30fc4a967eed3184114c919890998354402cd59f07c19faf69bef"
        ),
        .binaryTarget(
            name: "libavfilter",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.2/libavfilter.xcframework.zip",
            checksum: "e4280f389fc1ea8f3bab46f4e705d6c2bf7bce6136a7b17db0a36f5f35af27fd"
        ),
        .binaryTarget(
            name: "libavformat",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.2/libavformat.xcframework.zip",
            checksum: "17dbc0b884b91f5e40e8b956c82ff2a62d592d9fa2636a4ddda85fe3f65d760d"
        ),
        .binaryTarget(
            name: "libavutil",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.2/libavutil.xcframework.zip",
            checksum: "18935edb064551aa3e2ce580e18476cacac1f0ad17d2d9db25c20173bd429eb0"
        ),
        .binaryTarget(
            name: "libswresample",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.2/libswresample.xcframework.zip",
            checksum: "a88af682aaa07059b3e3cecb235bf0dea602de6edf18f6cbe5cc9b408733c243"
        ),
        .binaryTarget(
            name: "libswscale",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.2/libswscale.xcframework.zip",
            checksum: "faf52286e4e0f3f155a4896e6dd7d3f39124d2be44988a95da38a81e98ddc3ba"
        ),
    ]
)
