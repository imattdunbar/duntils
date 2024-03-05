//
//  Duntils.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/26/24.
//

import Foundation
import OSLog

let log = Logger(subsystem: .loggerSubsystem, category: .loggerCategory)

public class Duntils {
    public static func setup() {
        log.debug("Setting up Duntils")
        DTRealm.setup()
    }
}
