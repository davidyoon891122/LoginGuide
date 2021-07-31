//
//  MainNavigationController.swift
//  LoginGuide
//
//  Created by David Yoon on 2021/07/31.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        if isLoggedIn() {
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
        
        
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return true
    }
    
    
    @objc func showLoginController() {
        let loginController = LoginController()
        loginController.modalPresentationStyle = .fullScreen
        present(loginController, animated: true, completion: {
            //
        })
    }
}


class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        navigationItem.title = "We're logged in"
    }
}
