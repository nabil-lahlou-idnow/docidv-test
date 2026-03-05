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
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.2/DocIDVCommon.xcframework.zip",
            checksum: "588bf60c03ddb67f31ca76187d74550b668c90814b4092cf7dc3c8d1d0d44e97"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.2/DocIDV.xcframework.zip",
            checksum: "dcbfed7a301bf795223f0293d98fa050ca14c3f01fa8e912137bc29807aca613"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.2/DocIDVAIModule.xcframework.zip",
            checksum: "3e6d1fe4bf0a6fad1d828f3ceb470d5ac723747e0548cf7508381084f5250c6c"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.2/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "9e627322cb13830099aee14fb2b67cf7692d62dc40da58d8f8d7ab980c7460fa"
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
