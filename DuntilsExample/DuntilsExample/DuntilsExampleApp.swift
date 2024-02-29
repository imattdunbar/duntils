//
//  DuntilsExampleApp.swift
//  DuntilsExample
//
//  Created by Matt Dunbar on 2/26/24.
//

import SwiftUI
import Duntils

@main
struct DuntilsExampleApp: App {
    
    init() {
        Duntils.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
