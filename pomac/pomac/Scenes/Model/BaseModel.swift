//
//  BaseModel.swift
//  pomac
//
//  Created by ziad on 11/03/2022.
//

import UIKit
struct BaseModel<T: Codable&CodableInit>: Codable, CodableInit {
    let status: Bool
    let data : T?
    let msg: String?
}
struct BaseModelArray<T: Codable&CodableInit>: Codable, CodableInit {
    let status: Bool
    let data : [T]?
    let msg: String?
}
struct StringModel: Codable, CodableInit {
    let status: Bool
    let data : String?
    let msg: String?
}
struct BoolModel: Codable, CodableInit {
    let status: Bool
    let data : Bool?
    let msg: String?
}
struct IntegerModel: Codable, CodableInit {
    let status: Bool
    let data : String?
    let msg: String?
}
struct ValueModel: Codable, CodableInit {
    let status: Bool
    let msg: String?
}
