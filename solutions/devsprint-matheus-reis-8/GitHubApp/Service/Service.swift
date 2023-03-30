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
            Repository(name: "hereminders-ios", owner: "devpass-tech"),
            Repository(name: "nexttunes-ios", owner: "devpass-tech"),
            Repository(name: "challenge-onboarding", owner: "devpass-tech"),
            Repository(name: "challeng-viewcode-realestate", owner: "devpass-tech"),
            Repository(name: "challenge-mvvm-delivery", owner: "devpass-tech"),
            Repository(name: "test-lucas", owner: "devpass-tech"),
            Repository(name: "mock-121331141-124afas", owner: "devpass-tech"),
            Repository(name: "mock--24fafs", owner: "devpass-tech"),
            Repository(name: "mock-11313141-124fafs", owner: "devpass-tech"),
            Repository(name: "mock-1213131141-24afafs", owner: "devpass-tech"),
            Repository(name: "mock-1213111-2afafs", owner: "devpass-tech"),
            Repository(name: "mock-12131114114aafs", owner: "devpass-tech"),
            Repository(name: "mock-1213131141-1afafs", owner: "devpass-tech")
        ])
    }
}
