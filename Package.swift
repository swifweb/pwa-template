// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "pwa-template",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "App", targets: ["App"]),
        .executable(name: "Service", targets: ["Service"])
    ],
    dependencies: [
        .package(url: "https://github.com/swifweb/web", from: "1.0.0-beta.1.19.0")
    ],
    targets: [
        .executableTarget(name: "App", dependencies: [
            .product(name: "Web", package: "web")
        ]),
        .executableTarget(name: "Service", dependencies: [
            .product(name: "ServiceWorker", package: "web")
        ], resources: [
            .copy("images/favicon.ico"),
            .copy("images")
        ]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
