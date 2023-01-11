//
//  CodableInit.swift
//  SwiftCairo-App
//
//  Created by ziad on 3/11/22.
//  Copyright © 2022 ziad. All rights reserved.
//

import Foundation

protocol CodableInit {
    init(data: Data) throws
}

extension CodableInit where Self: Codable {
    init(data: Data) throws {
        let decoder = JSONDecoder()
       // decoder.keyDecodingStrategy = .convertFromSnakeCase
        self = try decoder.decode(Self.self, from: data)
    }
}

extension Array: CodableInit where Element: Decodable {
    init(data: Data) throws {
        let decoder = JSONDecoder()
       // decoder.keyDecodingStrategy = .convertFromSnakeCase
        self = try decoder.decode(Self.self, from: data)
    }
 
}
