//
//  BaseViewController.swift
//  LearningFaceID
//
//  Created by Zewu Chen on 28/03/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import UIKit
import  LocalAuthentication

class BaseViewController: UIViewController {

    var screenAuth: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        screenAuth.frame =  CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
        screenAuth.backgroundColor = .blue
        LocalAuthenticationManager.shared.delegate = self
    }

}

extension BaseViewController: ScreenAuthenticationProtocol {
    func loginBackgroundScreen() {
        self.view.addSubview(screenAuth)
    }

    func logoutBackgroundScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
            self.screenAuth.removeFromSuperview()
        })
    }
}
