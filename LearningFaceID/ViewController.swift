//
//  ViewController.swift
//  LearningFaceID
//
//  Created by Zewu Chen on 24/03/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    var screenAuth: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        screenAuth.frame =  CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
        screenAuth.backgroundColor = .red
        LocalAuthenticationManager.shared.delegate = self
    }

}

extension ViewController: ScreenAuthenticationProtocol {
    func loginBackgroundScreen() {
        self.view.addSubview(screenAuth)
    }

    func logoutBackgroundScreen() {
        DispatchQueue.main.async {
            self.screenAuth.removeFromSuperview()
        }
    }


}
