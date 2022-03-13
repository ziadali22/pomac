//
//  Colors.swift
//  FontsHopeWork
//
//  Created by ziad on 09/10/2021.
//

import Foundation
import UIKit

extension DesignSystem{
    enum Colors: String{
        case primaryColor = "primaryColor"
        case secondaryColor = "secondayColor"
        case head = "head"
        case textGray = "textGray"
        

        var color: UIColor{
            switch self {
            case .primaryColor:
                return UIColor(named: self.rawValue)!
            case .secondaryColor:
                return UIColor(named: self.rawValue)!
            case .head:
                return UIColor(named: self.rawValue)!
            case .textGray:
                return UIColor(named: self.rawValue)!
            }
        }
    }
}
