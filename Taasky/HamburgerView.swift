//
//  HamburgerView.swift
//  Taasky
//
//  Created by Daniel Pratt on 2/23/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit

class HamburgerView: UIView {

    let imageView: UIImageView! = UIImageView(image: UIImage(named: "Hamburger"))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func rotate(fraction: CGFloat) {
        let angle = Double(fraction) * Double.pi
        imageView.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
    }
    
    // MARK: Private
    
    private func configure() {
        imageView.contentMode = UIViewContentMode.center
        addSubview(imageView)
    }

}
