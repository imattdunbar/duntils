//
//  DTNetworkDebugView.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/29/24.
//

import SwiftUI
import RealmSwift

public struct DTNetworkDebugView: View {
    
    // Public init needed for access outside of package
    public init() {}
    
    public var body: some View {
        ZStack {
            LogListView()
        }
        .environment(\.realm, DTRealm.getDB())
    }
}

struct LogListView: View {
    
    @ObservedResults(DTRequestLog.self) var logs
    
    var body: some View {
        List(logs, id: \.taskId) { log in
            LogCell(log: log)
        }
    }
    
}

struct LogCell: View {
    
    let log: DTRequestLog
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(log.url).bold()
            Text("\(log.statusCode)")
//            Text("\(log.data ?? "")").lineLimit(3)
        }
    }
}
