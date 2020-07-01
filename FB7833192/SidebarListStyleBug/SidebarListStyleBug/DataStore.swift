//
//  DataStore.swift
//  SidebarListStyleBug
//
//  Created by Indragie Karunaratne on 7/1/20.
//

import Foundation

final class DataStore: ObservableObject {
    @Published var data = [String]()
    
    init() {
        // Simulate a load from the network
        DispatchQueue.main.async { [self] in
            data = ["foo", "bar", "baz"]
        }
    }
}
