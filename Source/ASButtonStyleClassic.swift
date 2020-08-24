//
//  ASButtonStyleClassic.swift
//  superapp
//
//  Created by Amit on 6/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASButtonStyleClassic: ASButton { 
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public init(_ delegate: ASButtonGestureRecognizer) {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    public func setup() {
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        container = UIView()
        addSubview(self.container.unsafelyUnwrapped)
        container?.clipsToBounds = true
        container?.layer.rasterizationScale = UIScreen.main.scale
        container?.layer.shouldRasterize = true
        setBordeColor(UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0))
        setBordeWidth(1.0)
         
        buttonImageView = UIImageView()
        container?.addSubview(self.buttonImageView.unsafelyUnwrapped)
        
        buttonLabel = UILabel()
        container?.addSubview(self.buttonLabel.unsafelyUnwrapped)
        buttonLabel?.textAlignment = .center
        buttonLabel?.textColor = .white
        
        self.isUserInteractionEnabled = true
        let tapGestureRecognizer = ASButtonGestureRecognizer(target: self, action: #selector(customButtonEvent(_:)))
        tapGestureRecognizer.firstObject = nil
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    public func setupConstraints() {
        container?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            container?.topAnchor.constraint(equalTo: topAnchor, constant: PADDING).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor, constant: PADDING).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -PADDING).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -PADDING).isActive = true
            
            buttonImageView?.translatesAutoresizingMaskIntoConstraints = false
            buttonImageView?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
            buttonImageView?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: 0).isActive = true
            buttonImageView?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -0).isActive = true
            buttonImageView?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -0).isActive = true
            
            buttonLabel?.translatesAutoresizingMaskIntoConstraints = false
            buttonLabel?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
            buttonLabel?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: 0).isActive = true
            buttonLabel?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -0).isActive = true
            buttonLabel?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -0).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
}


