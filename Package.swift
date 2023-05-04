// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "FireworkVideoGAMSupport",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(name: "FireworkVideoGAMSupport",
                 targets: ["FireworkVideoGAMSupport", "FireworkVideoGAMSupportDepdendencies"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", 
            .upToNextMajor(from: "10.4.0")
        ),
    ],
    targets: [
        .binaryTarget(
            name: "FireworkVideoGAMSupport",
            url: "https://github.com/loopsocial/firework_ios_sdk_gam_support/releases/download/v0.3.0/FireworkVideoGAMSupport-v0.3.0.xcframework.zip",
            checksum: "af8465084a17b75d9378dc4e145325c66233789f438ae5e6f3c8656c1dbad61d"
        ),
        .target(
            name: "FireworkVideoGAMSupportDepdendencies",
            dependencies: [
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ]
        )
    ]
)