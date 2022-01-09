//
//  RegisterViewController.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, RegisterViewProtocol {
    
// MARK: PROTOCOL VAR -
    var presenter: RegisterPresenterProtocol?
    
// MARK: LOCAL VAR -
    var profileImg: UIImage!
    
// MARK: @IBOUTLETS -
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orengeView: UIView!
    @IBOutlet weak var imgLogin: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var lblEmailAdoress: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var lineView2: UIView!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var lineView3: UIView!
    @IBOutlet weak var btnSingIn: UIButton!
    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var btnGoToSignIn: UIButton!
    @IBOutlet weak var btnIcon: UIButton!
    @IBOutlet weak var mainScroll: UIScrollView!
    
// MARK: LIFE CYCLE VIEW FUNCTIONS -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegates()
        setupGestures()
    }
    
// MARK: SETUP FUNCTIONS -
    private func setupUI() {
        imgLogin.circleImage()
        btnSingIn.layer.cornerRadius = 7
        redView.roundedObject(isCircle: true, size: 0.0)
        orengeView.roundedObject(isCircle: true, size: 0.0)
    }
    
    private func setupDelegates() {
        emailField.delegate = self
        passField.delegate = self
        nameField.delegate = self
    }
    
    private func setupGestures() {
        let tapSuperview = UITapGestureRecognizer(target: self, action:  #selector(TapSuperview))
        self.view.addGestureRecognizer(tapSuperview)
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
        if emailField.text != "" && passField.text != "" && nameField.text != "" {
            presenter?.postNewUser(email: emailField.text ?? "", password: passField.text ?? "", name: nameField.text ?? "", image: profileImg, nameImg: "")
        }else{
            showAlert(titleAlert: "Atención", messagge: "Por favor llena todos los campos")
            }
        }
    
    
// MARK: @IBACTIONS -
    @IBAction func signUpAction(_ sender: Any) {
       validateFields()
    }
    
    @IBAction func goToSignIn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addImgAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.modalPresentationStyle = .currentContext
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
// MARK: @OBJC FUNC -
    @objc func TapSuperview() {
        self.view.endEditing(true)
        mainScroll.setContentOffset(.zero, animated: true)
    }
    
}

// MARK: AUHT FUNCTIONS -

extension RegisterViewController {
    
    func successView() {
        print("DEBUG: SUCCESS REGISTER")
    }
    
    func failView() {
        print("error")
    }
    
}

extension RegisterViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        let selectImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
       // let photoLocalUrl = (info[UIImagePickerController.InfoKey.imageURL] as? URL)!
        imgLogin.image = selectImage
        profileImg = selectImage
      //  ActualizarImg(fromData: selectImage!)
            
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailField:
            passField.becomeFirstResponder()
            
        case passField:
            self.view.endEditing(true)
            mainScroll.setContentOffset(.zero, animated: true)
            
        default:
            emailField.becomeFirstResponder()
            
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case passField:
            mainScroll.setContentOffset(CGPoint(x: 0, y: 150), animated: true)
            
        default:
            break
            
        }
    }
    
}
