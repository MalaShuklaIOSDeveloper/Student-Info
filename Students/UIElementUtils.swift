//
//  UIElementUtils.swift
//  Students
//
//  Created by Ranjith Kumar on 6/23/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

/* DIAMOND OPERATOR*/
precedencegroup SingleTypeComposition {
    associativity: right
    higherThan: ForwardApplication
}

infix operator <>: SingleTypeComposition

func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}

/* PIPE OPERATOR*/
precedencegroup ForwardApplication {
    associativity: left
}
infix operator |>: ForwardApplication
public func |> <A, B>(x: A, f: (A) -> B) -> B {
    return f(x)
}

/* TextField */

let baseTextFieldStyle: (UITextField) -> Void = {
    $0.font = .systemFont(ofSize: 17)
    $0.borderStyle = .roundedRect
}

let emailTextFieldStyle: (UITextField) -> Void =  {
    $0.keyboardType = .emailAddress
    $0.placeholder = "Email"
    $0.autocorrectionType = .no
}

let passwordTextFieldStyle: (UITextField) -> Void = {
    $0.isSecureTextEntry = true
    $0.placeholder = "••••••••••••••••"
    $0.autocorrectionType = .no
}

let setAutocorrectionNo: (UITextField) -> Void = {
    $0.autocorrectionType = .no
}

let nextRetunKeyStyle: (UITextField) -> Void = {
    $0.returnKeyType = .next
    $0.enablesReturnKeyAutomatically = true
}

let doneReturnKeyStyle: (UITextField) -> Void = {
    $0.returnKeyType = .done
    $0.enablesReturnKeyAutomatically = true
}

let addLeftNRightView: (UITextField) -> Void = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: $0.frame.height))
    $0.leftView = view
    $0.rightView = view
    $0.leftViewMode = .always
    $0.rightViewMode = .always
}

let setTranslatesAutoresizingMaskIntoConstraints : (UIView) -> Void = {
    $0.translatesAutoresizingMaskIntoConstraints = false
}

let phoneToolbar: (UITextField) -> Void = {
    let toolbar = UIToolbar(frame: CGRect(x:0,y:0,width:Constants.Screen.bounds.width,height:50))
    let flexibleSapceBtnItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    toolbar.items = [flexibleSapceBtnItem]
    $0.inputAccessoryView = toolbar
}

/* UIButton */
let baseButtonStyle: (UIButton) -> Void = {
    $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
    $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    $0.layer.cornerRadius = 8
    buttonThemeStyle($0)
}

let buttonThemeStyle: (UIButton) -> Void = {
    $0.layer.borderWidth = 1.5
    $0.layer.borderColor = UIColor.rgb(r: 50, g: 199, b: 242).cgColor
    $0.setTitleColor(UIColor.rgb(r: 50, g: 199, b: 242),for: .normal)
    $0.layer.cornerRadius = 3.0
}

let toggleThemeStyle: (UIButton,Bool) -> Void = {
    $0.isEnabled = $1
    if $1 {
        $0.layer.borderColor = UIColor.rgb(r: 50, g: 199, b: 242).cgColor
        $0.setTitleColor(UIColor.rgb(r: 50, g: 199, b: 242),for: .normal)
    }else {
        $0.layer.borderColor = UIColor.rgb(r: 50, g: 199, b: 242).withAlphaComponent(0.5).cgColor
        $0.setTitleColor(UIColor.rgb(r: 50, g: 199, b: 242).withAlphaComponent(0.5),for: .normal)
    }
}
