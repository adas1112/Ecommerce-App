//
//  loginVC.swift
//  Ecommerce App
//
//  Created by Bilal on 27/03/25.
//

import UIKit
import GoogleSignIn
import AuthenticationServices

class loginVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var googleSignInBtn: UIButton!
    @IBOutlet weak var appleSignInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        txtEmail.returnKeyType = .next
        txtPassword.returnKeyType = .done
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func appleSignInBtnClick(_ sender: Any) {
        
    }
    
    @IBAction func googleBtnSignInClick(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            self.googleSignInBtn.isHidden = false
            //self.lblSignInStatus.text = "Welcome To GoogleSignIn! To continue with GoogleSignIn please hit below button. "
            guard error == nil else { return }
            
            // If sign in succeeded, display the app's main content View.
            guard let signInResult = signInResult else { return }
            let user = signInResult.user
            
            let emailAddress = user.profile?.email
            let fullName = user.profile?.name
            let familyName = user.profile?.familyName
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            
            //            self.lblSignInStatus.text = "Hi \(fullName ?? "")"
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "getStartedVC") as! getStartedVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func signUpBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "signUpVC") as! signUpVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "getStartedVC") as! getStartedVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgetPassBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "forgetPasswordVC") as! forgetPasswordVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder()
                scrollToTextField(nextField)
            }
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Scroll to Current TextField
    private func scrollToTextField(_ textField: UITextField) {
        let textFieldFrame = textField.convert(textField.bounds, to: scrollView)
        scrollView.scrollRectToVisible(textFieldFrame, animated: true)
    }
    
    // MARK: - Adjust ScrollView When Keyboard Appears
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            scrollView.contentInset.bottom = keyboardFrame.height + 20
        }
    }
    
    // MARK: - Reset ScrollView When Keyboard Hides
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset.bottom = 0
    }
}
