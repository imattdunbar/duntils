//
//  FileManager.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/28/24.
//

import Foundation

extension FileManager {
    
    public static var documentsURL: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
}
