//
//  LoginViewController.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 05/01/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, LoginViewProtocol {
    
// MARK: @IBOUTLETS -
    @IBOutlet weak var pinkView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var holaImg: UIImageView!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var btnForgotPass: UIButton!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var lineView2: UIView!
    @IBOutlet weak var btnSingIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var mainScroll: UIScrollView!
    
// MARK: PROTOCOL VAR -
    var presenter: LoginPresenterProtocol?

// MARK: LIFE CYCLE VIEW FUNCTIONS -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGestures()
        setupDelegates()
    }
    
// MARK: SETUP FUNCTIONS -
    private func setupUI() {
        pinkView.roundedObject(isCircle: true, size: 0.0)
        orangeView.roundedObject(isCircle: true, size: 0.0)
        holaImg.circleImage()
        btnSingIn.layer.cornerRadius = 7
    }
    
    private func setupGestures() {
        let superTap = UITapGestureRecognizer(target: self, action: #selector(TapSuperView))
        self.view.addGestureRecognizer(superTap)
    }
    
    private func setupDelegates() {
        emailTextField.delegate = self
        passField.delegate = self
    }
    
    private func showAlert(titleAlert: String, messagge: String) {
        let alert = UIAlertController(title: titleAlert, message: messagge, preferredStyle: .alert)
        
        let accept = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(accept)
        present(alert, animated: true, completion: nil)
    }
    
    
// MARK: VALIDATE FUNCTIONS -
    private func validateFields() {
        if emailTextField.text != "" && passField.text != "" {
            presenter?.loginAuthFirebase(email: emailTextField.text ?? "", password: passField.text ?? "")
        }else{
            showAlert(titleAlert: "Atención", messagge: "Por favor llena todos los campos")
        }
    }
    
    
// MARK: @IBACTIONS -
    @IBAction func signInAction(_ sender: Any) {
       validateFields()
    }
    
    @IBAction func goToSignUp(_ sender: Any) {
        let module = RegisterRouter.getController()
        self.navigationController?.pushViewController(module, animated: true)
    }
    
// MARK: @OBJC FUNCITON -
    @objc func TapSuperView() {
        mainScroll.setContentOffset(.zero, animated: true)
        self.view.endEditing(true)
    }
    
}

// MARK: AUTHENTICATION FFIREBASE FUNCTIONS -
extension LoginViewController {
    
    func successAuthLogin() {
        print("DEBUG: SUCCESS LOGIN")
    }
    
    func failAuthLogin() {
        showAlert(titleAlert: "Atención", messagge: "Correo o contraseña incorrectos")
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passField.becomeFirstResponder()
        default:
            self.view.endEditing(true)
            mainScroll.setContentOffset(.zero, animated: true)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            break
        default:
            mainScroll.setContentOffset(CGPoint(x: 0, y: 150), animated: true)
            
        }
    }
    
}
