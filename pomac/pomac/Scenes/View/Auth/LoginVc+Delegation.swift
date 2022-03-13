//
//  LoginVc+Delegation.swift
//  pomac
//
//  Created by ziad on 12/03/2022.
//

import Foundation
extension LoginVC: LoginView{
    func sucessLogin() {
        self.openAlert(title: "Success", message: "success login", alertStyle: .alert, actionTitles: ["Go to main page"], actionStyles: [.default], actions: [{ _ in
            self.animation()
        }])
    }
    
    func enterTheHardCodedEmailAndPassword() {
        self.openAlert(title: "Alert", message: "please enter the HardCoded email and passsword", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
            print("")
        }])
    }
    

    
    func showErrorAlert(error: Error) {
        self.openAlert(title: "Alert", message: error.localizedDescription, alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
            print("")
        }])
    }
    
    
}
