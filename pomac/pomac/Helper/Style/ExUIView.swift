//
//  ExUIView.swift
//  pomac
//
//  Created by ziad on 11/03/2022.
//

import Foundation
import UIKit
extension UIView{
    @IBInspectable var cornerRadius : CGFloat{
        get{
            return CGFloat()
        }set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var borderwidth : CGFloat{
        get{
            return CGFloat()
        }set{
            self.layer.borderWidth = newValue
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var borderColor : UIColor{
        get{
            return UIColor()
        }set{
            self.layer.borderColor = newValue.cgColor
            self.layer.masksToBounds = true
        }
    }
    
    func showLoader(_ backgroundColor:UIColor? = nil ,_ activityColor : UIColor? = .gray){
        
        let LoaderView  = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        LoaderView.tag = -1
        LoaderView.backgroundColor = backgroundColor
        let Loader = UIActivityIndicatorView(/*frame: CGRect(x: 0, y: 0, width: 60, height: 30)*/)
        Loader.center = LoaderView.center
       // Loader.style = .whiteLarge
        Loader.color = activityColor
        Loader.startAnimating()
        LoaderView.addSubview(Loader)
        self.addSubview(LoaderView)
    }

    func dismissLoader(){
        
        self.viewWithTag(-1)?.removeFromSuperview()
    }
}
class gradientView: UIImageView{
    var topColor = UIColor.clear.cgColor
    var bottomColor = DesignSystem.Colors.primaryColor.color.cgColor
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            topColor,
            bottomColor
        ]
        gradientLayer.locations = [0.3, 1]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
}
