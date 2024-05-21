//
//  ShadowImageView.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 15/05/2024.
//

import UIKit

final class ShadowImageView: UIImageView {
    
    fileprivate lazy var imageView: UIImageView  = { [unowned self] in
        let imageView = UIImageView(frame: self.bounds)
        imageView.clipsToBounds = true
        imageView.contentMode = contentMode
        imageView.layer.cornerRadius = 4
        imageView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        imageView.backgroundColor = UIColor.white
        addSubview(imageView)
        return imageView
    }()
    
    override var image: UIImage? {
        set {
            imageView.image = newValue
        }
        get {
            return imageView.image
        }
    }
    
    override var backgroundColor: UIColor? {
        set {
            imageView.backgroundColor = newValue
        }
        get {
            return imageView.backgroundColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        layer.backgroundColor = UIColor.clear.cgColor
        layer.applySketchShadow(color: UIColor.black,
                                alpha: 0.15,
                                x: 0,
                                y: 15,
                                blur: 30,
                                spread: 0)
    }

}
