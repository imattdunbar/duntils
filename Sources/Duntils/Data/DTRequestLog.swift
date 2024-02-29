//
//  DTRequestLog.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/29/24.
//

import Foundation
import RealmSwift

class DTRequestLog: Object, Identifiable {
    @Persisted(primaryKey: true) var taskId: String
    @Persisted var statusCode: Int
    @Persisted var url: String
    @Persisted var data: String?
    
    static func create(taskId: String, statusCode: Int, url: String, data: Data? = nil) -> DTRequestLog {
        let log = DTRequestLog()
        log.taskId = taskId
        log.statusCode = statusCode
        log.url = url
        log.data = nil
        return log
    }
    
    func save() {
        DTRealm.write(self)
    }
    
    static func getByTaskId(_ taskId: String) -> DTRequestLog? {
        let logs = DTRealm.getDB().objects(self)
        let log = logs.where { $0.taskId == taskId }
        return log.first
    }
    
    func appendData(_ data: Data) {
        DTRealm.getDB().beginWrite()
        self.data = (self.data ?? "") + data.toPrettyJSON()
        DTRealm.commit()
    }
    
}
