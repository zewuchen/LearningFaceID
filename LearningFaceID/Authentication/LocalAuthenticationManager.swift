//
//  LocalAuthenticationManager.swift
//  LearningFaceID
//
//  Created by Zewu Chen on 24/03/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import LocalAuthentication
import UIKit

protocol ScreenAuthenticationProtocol {
    func loginBackgroundScreen()
    func logoutBackgroundScreen()
}

final class LocalAuthenticationManager {

    static let shared: LocalAuthenticationManager = LocalAuthenticationManager()
    private var reason: String
    public var delegate: ScreenAuthenticationProtocol?

    private init() {
        reason = "Log in to your account"
    }

    func auth() {
        delegate?.loginBackgroundScreen()

        let context: LAContext = LAContext()
        var error: NSError?

        if #available(iOS 8.0, macOS 10.12.1, *) {

            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {

                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

                    if success {

                        // Move to the main thread because a state update triggers UI changes.
                        DispatchQueue.main.async {
                            self.delegate?.logoutBackgroundScreen()
                        }

                    } else {
                        print(error?.localizedDescription ?? "Failed to authenticate")

                        // Fall back to a asking for username and password.
                        // ...
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Can't evaluate policy")

                delegate?.logoutBackgroundScreen()

                // Fall back to a asking for username and password.
                // ...
            }
        }
    }
}
