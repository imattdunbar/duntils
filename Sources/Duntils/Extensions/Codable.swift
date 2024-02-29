//
//  Codable.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/28/24.
//

import Foundation

extension Encodable {
    
    public func toData() throws -> Data {
        return try JSONEncoder.main.encode(self)
    }
    
    public func toDataOrNil() -> Data? {
        return try? JSONEncoder.main.encode(self)
    }

    public func asDictionary() throws -> [String : Any] {
        do {
            let data = try self.toData()
            guard let dict = try JSONSerialization.jsonObject(with: data) as? [String : Any] else {
                throw "Could not cast data to [String : Any]"
            }
            return dict
        }
        catch {
            throw error
        }
    }
    
    public func asDictionaryOrNil() -> [String : Any]? {
        guard let data = self.toDataOrNil(),
              let dict = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else {
            return nil
        }
        return dict
    }

    public func asDictionaryArray() throws -> [[String : Any]] {
        do {
            let data = try self.toData()
            guard let dict = try? JSONSerialization.jsonObject(with: data) as? [[String : Any]] else {
                throw "Could not cast data to [[String : Any]]"
            }
            return dict
        }
        catch {
            throw error
        }
    }
    
    public func asDictionaryArrayOrNil() -> [[String : Any]]? {
        guard let data = self.toDataOrNil(),
              let dict = try? JSONSerialization.jsonObject(with: data) as? [[String : Any]] else {
            return nil
        }
        return dict
    }
    
}
