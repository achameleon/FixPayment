//
//  KeyboardListener.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import UIKit
import Foundation

protocol KeyboardManagerDelegate: class {
    
    func onKeyboardWillShow(keyboardSize: CGSize)
    
    func onKeyboardWillHide(keyboardSize: CGSize)
    
}

class KeyboardManager: NSObject {
    
    weak var delegate: KeyboardManagerDelegate?
    
    override
    init() {
        super.init()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    func keyboardWillShow(_ notification:Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size ?? CGRect.zero.size
        delegate?.onKeyboardWillShow(keyboardSize: keyboardSize)
    }
    
    @objc
    func keyboardWillHide(_ notification:Notification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size ?? CGRect.zero.size
        delegate?.onKeyboardWillHide(keyboardSize: keyboardSize)
    }
    
}

