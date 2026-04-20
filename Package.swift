// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DocIDV",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "DocIDV",
            targets: ["DocIDV-Target-Wrapper"]
        ),
        .library(
            name: "EID-Governikus",
            targets: ["EID-Governikus-Target-Wrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/idnow/eid-sdk-ios.git", exact: "1.3.4"),
        .package(url: "https://github.com/unissey/sdk-ios.git", exact: "4.0.0"),
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.1.8")
    ],
    targets: [
        .binaryTarget(
            name: "DocIDVCommon",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.7.0/DocIDVCommon.xcframework.zip",
            checksum: "bfc38d3affa3d452925d4246d1d2253306e61a0c44296c3a2dde8b19210a4fe6"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.7.0/DocIDV.xcframework.zip",
            checksum: "dfae9adf26c7bdedf248e5fe2b0385a5ad329ba1051895e3751457a64f756839"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.7.0/DocIDVAIModule.xcframework.zip",
            checksum: "9eaa34a41af50c94bd22dc8d13a9ff49c30000974df51be6a61016791844d660"
        ),
        .binaryTarget(
            name: "DocIDVAI",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.7.0/DocIDVAI.xcframework.zip",
            checksum: "1f954ef766040abf09cce47ef77e0bc0c641661c65620919334e0fc20db8935a"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.7.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "bd5a6db2825e357b0932c74a1a9e8bfdf24a8bf01f0cf3179cc437c2a1d4276d"
        ),
        .binaryTarget(
            name: "FaceTecSDK",
            path: "Frameworks/FaceTecSDK.xcframework"
        ),
        .binaryTarget(
            name: "ReadID_UI",
            path: "Frameworks/ReadID_UI.xcframework"
        ),
        .target(
            name: "DocIDV-Target-Wrapper",
            dependencies: [
                // Local DocIDV sdk binaries
                "DocIDV",
                "DocIDVCommon",
                "DocIDVAIModule",
                "DocIDVAI",
                // External frameworks saved locally
                "FaceTecSDK",
                "ReadID_UI",
                // External public frameworks
                .product(name: "UnisseySdk", package: "sdk-ios"),
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios")
            ],
            path: "sources"
        ),
        .target(
            name: "EID-Governikus-Target-Wrapper",
            dependencies: [
                // Local DocIDV sdk binaries
                "DocIDV",
                "DocIDVCommon",
                "DocIDVAIModule",
                "DocIDVAI",
                "DocIDVEIDGovernikusModule",
                // External frameworks saved locally
                "FaceTecSDK",
                "ReadID_UI",
                // External public frameworks
                .product(name: "UnisseySdk", package: "sdk-ios"),
                .product(name: "IDnowEIDGovernikus", package: "eid-sdk-ios")
            ],
            path: "sources-eid-governikus"
        )
    ]
)
