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
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.4.0/DocIDVCommon.xcframework.zip",
            checksum: "6f7e78465d5e08e3c7774df530e35f1484ba7c219b94e71d2e2fd5f6cd31b181"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.4.0/DocIDV.xcframework.zip",
            checksum: "fc0ac6695753d1eaa80b310132d1828ee3303ec462d733c8c6a7df593b215410"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.4.0/DocIDVAIModule.xcframework.zip",
            checksum: "d85a0c4d1399539bb28e1d1757839a2c58ef9e0cd85e58c42a0c5b6cbd5dec06"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.4.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "d23709c02f3473303122aacefc1b5873987dc587a21506d5333ef82a852aee4b"
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
                .product(name: "IDnowEIDGovernikus", package: "eid-deploy-test")
            ],
            path: "sources-eid-governikus"
        )
    ]
)
