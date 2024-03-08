// swift-tools-version:5.10
import PackageDescription


let swiftSettings: [SwiftSetting] = [.enableExperimentalFeature("StrictConcurrency")]

let package = Package(
	name: "SemiSingleton",
	platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
	products: [
		.library(name: "SemiSingleton", targets: ["SemiSingleton"]),
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-log.git",               from: "1.2.0"),
		.package(url: "https://github.com/Frizlab/RecursiveSyncDispatch.git", from: "1.0.0"),
		.package(url: "https://github.com/Frizlab/SafeGlobal.git",            from: "0.3.0"),
	],
	targets: [
		.target(name: "SemiSingleton", dependencies: [
			.product(name: "Logging",               package: "swift-log"),
			.product(name: "RecursiveSyncDispatch", package: "RecursiveSyncDispatch"),
			.product(name: "SafeGlobal",            package: "SafeGlobal"),
		], swiftSettings: swiftSettings),
		.testTarget(name: "SemiSingletonTests", dependencies: ["SemiSingleton"], swiftSettings: swiftSettings)
	]
)
