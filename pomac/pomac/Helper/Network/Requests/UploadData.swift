//
//  DataFile.swift
//  SwiftCairo-App
//
//  Created by ziad on 3/11/22.
//  Copyright © 2022 ziad. All rights reserved.
//

import Foundation

struct UploadData {
    var data: Data? = nil
    var /*fileName, mimeType,*/ name: String
    var videoURL: URL? = nil
    var type: String
}

struct UploadDataURL {
    var data: URL
    var /*fileName, mimeType,*/ name: String
}
