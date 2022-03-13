//
//  LoginVC.swift
//  pomac
//
//  Created by ziad on 11/03/2022.
//

import UIKit
import SkyFloatingLabelTextField
class LoginVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var loginText: UILabel!
    @IBOutlet weak var subDescriptionText: UILabel!

    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    
    // MARK: - Properties
    var presenter: AuthLoginRepresenter!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AuthLoginRepresenter(view: self)
        configureUI()
    }
    // MARK: - Configurations
    private func configureUI(){
        loginText.font = DesignSystem.TypoGraphy.authHead.font
        subDescriptionText.font = DesignSystem.TypoGraphy.title
            .font
        [emailTextField,passwordTextField].forEach { item in
            item?.font = DesignSystem.TypoGraphy.body.font
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        presenter.loginAction(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    func animation(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.loginText.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { (_ ) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.loginText.alpha = 0
                self.loginText.transform = CGAffineTransform(translationX:0, y: -200)
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.subDescriptionText.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: { (_ ) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.subDescriptionText.alpha = 0
                self.subDescriptionText.transform = CGAffineTransform(translationX:0, y: -200)
            }completion: { (_) in
                let viewController = RecipesViewController()
                self.show(viewController, sender: nil)
            }
        }
        
        
    }
    
}
