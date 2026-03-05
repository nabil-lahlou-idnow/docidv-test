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
        .package(url: "https://github.com/nabil-lahlou-idnow/docidv-ai-test.git", exact: "1.6.0"),
        .package(url: "https://github.com/thomas-legris-idnow/eid-deploy-test.git", exact: "3.4.0")
    ],
    targets: [
        .binaryTarget(
            name: "DocIDVCommon",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.1/DocIDVCommon.xcframework.zip",
            checksum: "6e65f4a60ce63de3f718dd684fe7a65563c17098b4ece69e4d9131e491b8e6af"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.1/DocIDV.xcframework.zip",
            checksum: "196ff6f7a74ff1d7bce98c9f44457fca32eff7c49e23374835734809a725ac05"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.1/DocIDVAIModule.xcframework.zip",
            checksum: "c47856899c7884fa5980d197cfd8246727eea960794a8e877f62d49f25dad843"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.1/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "2912e6d71717e3ea2c16425121d482832e747e2a66aa7202fe9eaabcca8a06f3"
        ),
        .target(
            name: "DocIDV-Target-Wrapper",
            dependencies: [
                "DocIDV",
                "DocIDVCommon",
                "DocIDVAIModule",
                .product(name: "DocIDVAI", package: "docidv-ai-test")
            ],
            path: "sources"
        ),
        .target(
            name: "EID-Governikus-Target-Wrapper",
            dependencies: [
                "DocIDV",
                "DocIDVCommon",
                "DocIDVAIModule",
                "DocIDVEIDGovernikusModule",
                .product(name: "DocIDVAI", package: "docidv-ai-test"),
                .product(name: "EIDGovernikus", package: "eid-deploy-test")
            ],
            path: "sources-eid-governikus"
        )
    ]
)
