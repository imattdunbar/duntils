//
//  DTNetworkClient.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/29/24.
//

import Foundation
import Alamofire

public class DTNetworkClient {
    
    static let instance = DTNetworkClient()
    var session: Session!
    
    init() {
        let monitor = DTEventMonitor()
        let session = Session(eventMonitors: [monitor])
        self.session = session
    }
    
    public static func request(_ url: String) async {
        let _ = await instance.session.request(url).serializingData().response
    }
    
}
