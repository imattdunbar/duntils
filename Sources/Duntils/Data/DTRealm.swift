//
//  DTRealm.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/29/24.
//

import Foundation
import RealmSwift

class DTRealm {
    
    static private let instance = DTRealm()
    var realm: Realm!
    
    static func setup() {
        
        let databaseURL = FileManager.documentsURL.appendingPathComponent("duntils.realm")
        print("Database URL: \(databaseURL.path)")
        
        let config = Realm.Configuration(fileURL: databaseURL)
        instance.realm = try! Realm(configuration: config)
    }
    
    static func write(_ obj: Object) {
        do {
            try instance.realm.write {
                instance.realm.add(obj)
            }
        }
        catch {
            print("Error writing to Realm: \(error)")
        }
    }
    
    static func commit() {
        do {
            try instance.realm.commitWrite()
        }
        catch {
            print("Error committing write to Realm: \(error)")
        }
    }
    
    static func getDB() -> Realm {
        return instance.realm
    }
    
}
