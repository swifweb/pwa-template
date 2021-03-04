// swift-tools-version:5.3

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
        .package(url: "https://github.com/swifweb/web", from: "1.0.0-beta.1.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: [
            .product(name: "Web", package: "web")
        ]),
        .target(name: "Service", dependencies: [
            .product(name: "ServiceWorker", package: "web")
        ], resources: [
            .copy("images/favicon.ico"),
            .copy("images")
        ]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
