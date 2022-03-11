//
//  TypoGraphy.swift
//  FontsHopeWork
//
//  Created by ziad on 09/10/2021.
//

import Foundation
import UIKit

extension DesignSystem{
    enum TypoGraphy{
        case head
        case title
        case body
        case authHead
        
        private var fontDescriptor: CustomFontDescriptor{
            switch self {
            case .head:
                return CustomFontDescriptor(font: .bold, size: 24, style: .headline)
            case .title:
                return CustomFontDescriptor(font: .regular, size: 18, style: .title1)
            case .authHead:
                return CustomFontDescriptor(font: .bold, size: 32, style: .title1)
            case .body:
                return CustomFontDescriptor(font: .regular, size: 14, style: .body)
            
            }
        }
        //Dynamic Font
        var font: UIFont{
            guard let font = UIFont(name: fontDescriptor.font.name, size: fontDescriptor.size) else { return UIFont.preferredFont(forTextStyle: fontDescriptor.style) }
            let fontMetrices = UIFontMetrics(forTextStyle: fontDescriptor.style)
            return fontMetrices.scaledFont(for: font)
        }
    }
}
