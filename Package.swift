// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

//
//  Package.swift
//  Perfect-Kafka
//
//  Created by Rockford Wei on 2017-02-28.
//  Copyright © 2017 PerfectlySoft. All rights reserved.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2017 - 2018 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PackageDescription

let package = Package(
    name: "PerfectKafka",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PerfectKafka",
            targets: ["PerfectKafka"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        //.package(url: "https://github.com/PerfectlySoft/Perfect-LinuxBridge.git", from: "3.1.0"),
        //.package(url: "https://github.com/janipasanen/Perfect-libKafka.git", from: "1.0.0-JP")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .systemLibrary(name: "ckafka",
                       pkgConfig: "rdkafka",
                       providers: [
                            .brew(["librdkafka"]),
                            .apt(["librdkafka-dev"])
                       ]
        ),
        .target(
            name: "PerfectKafka",
            dependencies: ["ckafka"]
        ),
        .testTarget(
            name: "PerfectKafkaTests",
            dependencies: ["PerfectKafka"]
        ),
    ]
)

