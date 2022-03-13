//
//  extValidatoinModel.swift
//  pomacTests
//
//  Created by ziad on 13/03/2022.
//

import Foundation
@testable import pomac
extension ValidationLogin {
    
    func isValidEmail() -> Bool {
        return email.contains("@") && email.contains(".")
    }

    func isValidPasswordLength() -> Bool {
        return password.count >= 4 && password.count <= 16
    }
    
    func isDataValid() -> Bool {
        return isValidEmail() && isValidPasswordLength()
    }
}
