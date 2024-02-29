//
//  File.swift
//  
//
//  Created by Matt Dunbar on 2/28/24.
//

import Foundation

extension JSONDecoder {
    public static var main: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }

}

extension JSONEncoder {
    public static var main: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }
}
