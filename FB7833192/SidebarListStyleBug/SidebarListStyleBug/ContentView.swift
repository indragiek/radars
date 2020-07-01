//
//  ContentView.swift
//  SidebarListStyleBug
//
//  Created by Indragie Karunaratne on 7/1/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataStore = DataStore()
    
    var body: some View {
        NavigationView {
            List(dataStore.data, id: \.self) {
                Text($0)
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
