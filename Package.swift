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
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.1/ffmpegkit.xcframework.zip",
            checksum: "3f5d4c61c5c4b11d3b786a0d2f743fcb9b6a594a0fdb6de97eee5167e2a1d0e7"
        ),
        .binaryTarget(
            name: "libavcodec",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.1/libavcodec.xcframework.zip",
            checksum: "d3d4a3131a3f2654abd651507e6476da66b80af922304eb33b3fa3e11464f78d"
        ),
        .binaryTarget(
            name: "libavdevice",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.1/libavdevice.xcframework.zip",
            checksum: "553702f4d0abc692c13816fb455b50250d49944d84dfbe96e2e269189b94032f"
        ),
        .binaryTarget(
            name: "libavfilter",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.1/libavfilter.xcframework.zip",
            checksum: "e913cd9a15b96f89c59592a475b3da8aed7c5ee79ab10f92056ff6cd5478300c"
        ),
        .binaryTarget(
            name: "libavformat",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.1/libavformat.xcframework.zip",
            checksum: "bc20fcb10a1070bd69eb86cc4367cf885cb44d219de0162e33920b12806edc21"
        ),
        .binaryTarget(
            name: "libavutil",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.1/libavutil.xcframework.zip",
            checksum: "c12a8659cb89742c65a5f9353f24696e166b0f5fc608d111178d4fe9c0bf08f7"
        ),
        .binaryTarget(
            name: "libswresample",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.1/libswresample.xcframework.zip",
            checksum: "4598512401a486a99e5c28f0d3b4efa305b20263e1ad7d23177e8bd2d57c7cc1"
        ),
        .binaryTarget(
            name: "libswscale",
            url: "https://github.com/panofm/ffmpeg-kit-next/releases/download/v9.0.0-pano.1/libswscale.xcframework.zip",
            checksum: "8341630a3a9a538baf62fcb5c1c71b5ad4b0dfe0e3f4e2d6cfa3df259a3840fb"
        ),
    ]
)
