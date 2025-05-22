//
//  signUpVC.swift
//  Ecommerce App
//
//  Created by Bilal on 27/03/25.
//

import UIKit

class signUpVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtEmail : UITextField!
    @IBOutlet weak var txtPassword : UITextField!
    @IBOutlet weak var txtConfirmPassword : UITextField!
    @IBOutlet weak var scrollView : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtEmail.delegate = self
        txtPassword.delegate = self
        txtConfirmPassword.delegate = self

        txtEmail.returnKeyType = .next
        txtPassword.returnKeyType = .next
        txtConfirmPassword.returnKeyType = .done
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func createAccBtnClick(_ sender: Any) {
    }
    
    
    @IBAction func loginBtnClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
