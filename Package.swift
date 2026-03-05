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
            checksum: "3fc30f2174d0227359835a0fc339629fe6961be700806ae6450e15a1a7037091"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDV.xcframework.zip",
            checksum: "f0b162c7d714670a9bb957f290d269f5b6d2b4cf8c4a1beb7279b35e2cb36929"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDVAIModule.xcframework.zip",
            checksum: "beeb0d120ba6b6c229db8ca3dcf298872ad887ba6b67d19c7d80b52b01b64bbb"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/nabil-lahlou-idnow/docidv-test/releases/download/1.0.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "f75a0b263187c010fa3a5ab39c33d7ef79100f45e3d95fc92cc4c1c895c39958"
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
