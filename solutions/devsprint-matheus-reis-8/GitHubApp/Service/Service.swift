//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {
    func fetchList(_ completion: ([Repository]) -> Void) {
        completion([
            Repository(name: "hereminders-ios", userName: "devpass-tech"),
            Repository(name: "nexttunes-ios", userName: "devpass-tech"),
            Repository(name: "challenge-onboarding", userName: "devpass-tech"),
            Repository(name: "challeng-viewcode-realestate", userName: "devpass-tech"),
            Repository(name: "challenge-mvvm-delivery", userName: "devpass-tech"),
            Repository(name: "test-lucas", userName: "devpass-tech"),
            Repository(name: "mock-121331141-124afas", userName: "devpass-tech"),
            Repository(name: "mock--24fafs", userName: "devpass-tech"),
            Repository(name: "mock-11313141-124fafs", userName: "devpass-tech"),
            Repository(name: "mock-1213131141-24afafs", userName: "devpass-tech"),
            Repository(name: "mock-1213111-2afafs", userName: "devpass-tech"),
            Repository(name: "mock-12131114114aafs", userName: "devpass-tech"),
            Repository(name: "mock-1213131141-1afafs", userName: "devpass-tech")
        ])
    }
}
