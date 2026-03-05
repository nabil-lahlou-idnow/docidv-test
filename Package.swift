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
            checksum: "58322284d623210cf4a1a5b20e6abe1be170bfaa17f626cc9ef2cc674e651e22"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDV.xcframework.zip",
            checksum: "69f0aea2bbd072a2f83d443f802403f367f73bf0d43e63c4a4d6dbe434106b82"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDVAIModule.xcframework.zip",
            checksum: "2a1a011a0bd22e397add1ac2cddae3ddaae04c0eed87471d3b35e3273e63f55f"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "7e7149ac3be040ab9faf63d20bdcc342491c956579ea395be65e4b6b8e47dafc"
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
