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
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDVCommon.xcframework.zip",
            checksum: "1cf4f82ef9c0d8ccacf0e923a7ef3ad309a3494462f6e22612e6e0f5995791b4"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDV.xcframework.zip",
            checksum: "fac663bf6ed9563b25023aa45964970e222335f6d57946c09aacc37cd4eab919"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDVAIModule.xcframework.zip",
            checksum: "fcf9dc81b1dc29e217ee082b724f5a7099930e274333623db87a698438a36170"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "bbc3dac166cf1cd938173c9e872b494f0006c928b10cf71a014779d0a5710e10"
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
            path: "sources"
        )
    ]
)
