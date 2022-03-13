//
//  AuthLoginRepresenter.swift
//  pomac
//
//  Created by ziad on 12/03/2022.
//

import Foundation
protocol LoginView: AnyObject{
    func sucessLogin()
    func enterTheHardCodedEmailAndPassword()
    func showErrorAlert(error: Error)
}
enum AppError: LocalizedError{
    case invalidEmail
    case invalidPassword
    var errorDescription: String? {
        return failureReason
    }
    var failureReason: String?{
        switch self {
        case .invalidEmail:
            return "check valid Email"
        case .invalidPassword:
            return "check valid password"
        }
    }
}
struct ValidationLogin {
    let email, password: String
    
    init (email: String?, password: String?) throws {
        guard let email = email, !email.isEmpty else { throw AppError.invalidEmail }
        guard let password = password, !password.isEmpty else { throw AppError.invalidPassword }

        self.email = email
        self.password = password
    }
}

class AuthLoginRepresenter{
    private weak var view: LoginView?
    init(view: LoginView){
        self.view = view
    }

    func loginAction(email: String, password: String){
        do{
            let inputs = try ValidationLogin(email: email, password: password)
            if inputs.email == "ziadali@gmail.com" && inputs.password == "1234"{
                view?.sucessLogin()
            }else{
                view?.enterTheHardCodedEmailAndPassword()
            }

        }catch{
            guard let error = error as? AppError else{return}
            view?.showErrorAlert(error: error)
        }
    }
}
