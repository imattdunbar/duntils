//
//  URLResponse.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/28/24.
//

import Foundation

extension URLResponse {
    public var HTTPURLResponse: HTTPURLResponse? {
        return self as? HTTPURLResponse
    }

    public func urlString() -> String {
        return self.url?.absoluteString ?? "Invalid URL"
    }

    public func statusCode() -> Int {
        return self.HTTPURLResponse?.statusCode ?? -9000
    }
}
