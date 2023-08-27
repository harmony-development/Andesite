// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "Andesite",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.77.1"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.6.0"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
            ]
        )
    ]
)
