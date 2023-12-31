// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RandomUserPackage",
    platforms: [
        .iOS("15.0"),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        
        .library( name: "Domain",targets: ["Domain"]),
        .library( name: "Data",targets: ["Data"]),
        .library( name: "Presentation",targets: ["Presentation"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.

        .target(name: "Domain", dependencies: []),
        .testTarget(name: "DomainTest", dependencies: ["Domain"]),
        
        .target(name: "Data", dependencies: ["Domain", "Moya"]),
        .testTarget(name: "DataTest", dependencies: ["Data"]),
        
        .target(name: "Presentation", dependencies: ["Domain"]),
        .testTarget(name: "PresentationTest", dependencies: ["Presentation"])
    ]
)
