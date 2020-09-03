//
//  ASBTextProps.swift
//  superapp
//
//  Created by Amit on 26/8/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASBTextProps {
    public var font: UIFont?
    public var textColor: UIColor?
    public var image: UIImage?
    
    public init(_ font: UIFont?, _ textColor: UIColor?, _ image: UIImage?) {
        self.font = font
        self.textColor = textColor
        self.image = image
    }
}
