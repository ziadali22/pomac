//
//  Font.swift
//  FontsHopeWork
//
//  Created by ziad on 09/10/2021.
//

import Foundation

enum Font: String{
    case regular = "Almarai-Regular"
    case bold = "Almarai-Bold"
    
    var name: String{
        return self.rawValue
    }
}
