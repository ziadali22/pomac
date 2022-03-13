//
//  DefaultResponse.swift
//  SwiftCairo-App
//
//  Created by ziad on 3/11/22.
//  Copyright © 2022 ziad. All rights reserved.
//

import Foundation

/// Default response to check for every request since this's how this api works. 
struct DefaultResponse: Codable, CodableInit {
    var status: Int
}
