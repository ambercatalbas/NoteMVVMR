//
//  KeyboardHelper.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 27.02.2022.
//

import UIKit

public protocol KeyboardHelperDelegate: AnyObject {
    
    func keyboardWillShow(_ keyboardHeight: CGFloat)
    func keyboardWillHide()
    
}

public class KeyboardHelper {
    
    public weak var delegate: KeyboardHelperDelegate?
    
    public init() {
        setObservers()
    }
    
    @objc
    private func keyboardWillShow(_ notification: Notification?) {
        guard
            let userInfo = notification?.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
            return
        }
        
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        delegate?.keyboardWillShow(keyboardHeight)
    }
    
    @objc
    private func keyboardWillHide(_ notification: Notification?) {
        delegate?.keyboardWillHide()
    }
    
    private func setObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
}
