//
//  Data.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/28/24.
//

import Foundation

extension Data {

    public func parseTo<T: Decodable>(_ type: T.Type) throws -> T {
        do {
            return try JSONDecoder.main.decode(type, from: self)
        } catch {
            throw error
        }
    }

    public func parseToOrNil<T: Decodable>(_ type: T.Type) -> T? {
        do {
            return try self.parseTo(T.self)
        } catch {
            return nil
        }
    }
    
    public func toStringAnyDict() throws -> [String : Any] {
        do {
            guard let json = try JSONSerialization.jsonObject(with: self) as? [String : Any] else {
                throw "Could not convert Data to [String : Any]"
            }
            return json
        } catch {
            throw error
        }
    }

    public func toStringAnyDictOrNil() -> [String : Any]? {
        guard let json = try? toStringAnyDict() else {
            return nil
        }
        return json
    }

    public func toString() -> String {
        let str = String(data: self, encoding: .utf8)
        return str.safe
    }
    
    public func toPrettyJSON() -> String {
        
        var out = ""

        do {
            // Deserialize the Data into a JSON object
            let jsonObject = try JSONSerialization.jsonObject(with: self, options: [])

            // Serialize the JSON object back to Data with pretty-printed formatting
            let prettyPrintedData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)

            // Convert the pretty-printed Data back to a String
            if let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
                out = prettyPrintedString
            } else {
                throw "Unable to convert pretty-printed Data to String"
            }
        } catch {
            if let string = String(data: self, encoding: .utf8) {
                out = string
            }
            else {
                out = error.localizedDescription
            }
        }

        return out
    }

}
