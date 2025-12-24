// swift-tools-version:5.4
import Foundation
import PackageDescription

let configHeaderSearchPath: String
#if TARGET_ANDROID
    configHeaderSearchPath = "../../config/android"
#else
    configHeaderSearchPath = "../../config/apple"
#endif

let package = Package(
    name: "expat",
    products: [
        .library(name: "expat", targets: ["expat"])
    ],
    targets: [
        .target(name: "expat", 
                path: "expat/lib",
                exclude: ["Makefile.am", "winconfig.h"],
                publicHeadersPath: ".",
                cSettings: [
                    .headerSearchPath(configHeaderSearchPath),
                    .define("XML_POOR_ENTROPY")
                ])
    ],
    cLanguageStandard: .c11
)
