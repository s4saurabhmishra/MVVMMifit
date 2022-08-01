//
//  ContentView.swift
//  MVVMDebate
//
//  Created by Mishra, Saurabh on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(value: "Text Item") {
                Text("Click to start the flow")
            }
            .navigationTitle("Landing View")
            .navigationDestination(for: String.self) { item in
                RootView()
                    .environmentObject(RootService())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
