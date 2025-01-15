// swift-tools-version:5.8
import PackageDescription

let package = Package(
    
    name: "XMGActionSheet",
    platforms: [.iOS(.v13)],
    
    products: [
        .library(
            name: "XMGActionSheet",
            targets: ["XMGActionSheet"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/OhKanghoon/FloatingBottomSheet", from: "2.3.0"),
    ],
    
    targets: [
        .target(
            name: "XMGActionSheet",
            dependencies: [
                .product(name: "FloatingBottomSheet", package: "FloatingBottomSheet")
            ], 
            path: "Sources"
        )
    ]
)


