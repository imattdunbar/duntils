//
//  ContentView.swift
//  DuntilsExample
//
//  Created by Matt Dunbar on 2/26/24.
//

import SwiftUI
import Duntils

struct ContentView: View {
    
    @State var showingNetworkDebug = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Button("Test GET 200") {
                    Task { await DTNetworkClient.request("https://jsonplaceholder.typicode.com/posts/1") }
                }
                
                Button("Test GET 404") {
                    Task { await DTNetworkClient.request("https://jsonplaceholder.typicode.com/posts/x") }
                }
                
                Button("Show Network Debug") {
                    showingNetworkDebug.toggle()
                }
            }
            .navigationTitle("Duntils")
            .sheet(isPresented: $showingNetworkDebug) {
                DTNetworkDebugView()
            }
        }
    }
}

#Preview {
    ContentView()
}
