//
//  ASButton.swift
//  superapp
//
//  Created by Amit on 6/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public typealias ASButtonIndex = Int
public typealias ASButtonSelectionClosure = (ASButtonIndex, String) -> Void

public class ASButton: UIView {
    public var index = 0
    public var container: UIView?
    public var buttonImageView: UIImageView?
    public var buttonLabel: UILabel?
    
    public var PADDING: CGFloat = 10
    public var iscCornerRadius = true
    
    public var selectionAction: ASButtonSelectionClosure?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if iscCornerRadius {
            let cornerRadius = (container?.bounds.size.height ?? 0 - PADDING*2) * 0.5
            container?.layer.cornerRadius = cornerRadius
        }
    }
}

extension ASButton {
    @discardableResult
    public func addBorderColorWithCornerMask(_ borderColor:UIColor, _ borderWidth:CGFloat, _ cornerRadius:CGFloat, _ maskedCorners:CACornerMask, _ clipsToBounds: Bool, _ shouldRasterize: Bool) -> ASButton {
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = shouldRasterize
        self.clipsToBounds = clipsToBounds
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        if #available(iOS 11.0, *) {
            layer.cornerRadius = cornerRadius
            layer.maskedCorners = maskedCorners
        } else {
            // Fallback on earlier versions
        }
        return self
    }

    @discardableResult
    public func setEvent(_ selectionAction: ASButtonSelectionClosure?) -> ASButton {
        self.selectionAction = selectionAction
        return self
    }
    
    @discardableResult
    public func setTintColor(_ color: UIColor?) -> ASButton {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func setParam(_ value: String?, _ image: UIImage?, _ contentMode: ContentMode?, _ selectionAction: ASButtonSelectionClosure?) -> ASButton {
        self.selectionAction = selectionAction
        if let value = value {
            setButtonTitle(value, nil, nil)
        }
        if let image = image {
            setImage(image, nil)
        }
        if let contentMode = contentMode {
            setContentMode(contentMode)
        }
        return self
    }
    
    @discardableResult
    public func setButtonTitle(_ value: String, _ image: UIImage?, _ contentMode: ContentMode?) -> ASButton {
        buttonLabel?.text = value
        if let image = image {
            setImage(image, nil)
        }
        if let contentMode = contentMode {
            setContentMode(contentMode)
        }
        return self
    }
    
    @discardableResult
    public func setImage(_ image: UIImage?, _ contentMode: ContentMode?) -> ASButton {
        if let image = image {
            buttonImageView?.image = image
        }
        if let contentMode = contentMode {
            setContentMode(contentMode)
        }
        return self
    }
    
    @discardableResult
    public func setContentMode(_ contentMode: ContentMode) -> ASButton {
        buttonImageView?.contentMode = contentMode
        return self
    }
    
    @discardableResult
    public func setBackgroundColor(_ color: UIColor) -> ASButton {
        container?.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func setTitleColor(_ color: UIColor) -> ASButton {
        buttonLabel?.textColor = color
        return self
    }
    
    @discardableResult
    public func setBordeColor(_ borderColor: UIColor) -> ASButton {
        container?.layer.borderColor = borderColor.cgColor
        return self
    }
    
    @discardableResult
    public func setBordeWidth(_ borderWidth: CGFloat) -> ASButton {
        container?.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ cornerRadius: CGFloat) -> ASButton {
        iscCornerRadius = false
        container?.layer.cornerRadius = cornerRadius
        return self
    }
}

extension ASButton {
    @objc func customButtonEvent(_ button: UIButton) {
        selectionAction?(index, buttonLabel?.text ?? "") 
    }
}

public class ASButtonGestureRecognizer: UITapGestureRecognizer {
    var firstObject: Any?
    
    func setFirstObject(_ sender: Any?) {
        self.firstObject = sender
    }
    
    func getFirstObject() -> Any? {
        return self.firstObject
    }
}
