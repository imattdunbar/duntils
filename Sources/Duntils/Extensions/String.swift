//
//  String.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/28/24.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

extension String {
    static var loggerSubsystem = Bundle.main.bundleIdentifier ?? "DuntilsLibrary"
    static var loggerCategory = "Duntils"
}
