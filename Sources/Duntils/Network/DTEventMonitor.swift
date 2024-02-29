//
//  DTEventMonitor.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/29/24.
//

import Foundation
import Alamofire

public class DTEventMonitor: EventMonitor {
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) {
        let taskId = UUID().uuidString
        dataTask.taskDescription = taskId
        let log = DTRequestLog.create(taskId: taskId, statusCode: response.statusCode(), url: response.urlString())
        log.save()
    }
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let taskId = dataTask.taskDescription ?? ""
        guard let log = DTRequestLog.getByTaskId(taskId) else { return }
        log.appendData(data)
    }
    
    public func request(_ request: Request, didCompleteTask task: URLSessionTask, with error: AFError?) {
        // Placeholder
    }
    
}
