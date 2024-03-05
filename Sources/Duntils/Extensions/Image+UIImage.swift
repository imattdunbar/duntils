//
//  Image+UIImage.swift
//  Duntils
//
//  Created by Matt Dunbar on 2/28/24.
//

import UIKit
import SwiftUI

extension UIImage {

    public var SwiftUI: Image {
        Image(uiImage: self)
    }

    public var SwiftUITemplate: Image {
        Image(uiImage: self).renderingMode(.template)
    }

}

extension Image {
    
    public var Template: Image {
        return self.renderingMode(.template)
    }
    
}
