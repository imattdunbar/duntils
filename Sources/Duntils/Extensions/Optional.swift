//
//  Optional.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/28/24.
//

import Foundation

public extension Optional where Wrapped == Bool {
    var safe: Bool {
        guard let unwrapped = self else { return false }
        return unwrapped
    }
}

public extension Optional where Wrapped == Int {
    var safe: Int {
        guard let unwrapped = self else { return 0 }
        return unwrapped
    }
}

public extension Optional where Wrapped == Double {
    var safe: Double {
        guard let unwrapped = self else { return 0.0 }
        return unwrapped
    }
}

public extension Optional where Wrapped == String {
    var safe: String {
        guard let unwrapped = self else { return "" }
        return unwrapped
    }
}
