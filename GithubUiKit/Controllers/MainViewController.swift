//
//  MainViewController.swift
//  GithubUiKit
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var loginLb: UITextField!
    var username = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getButoon(_ sender: Any) {
        
        guard let username = loginLb.text, !username.isEmpty else {
                   // Kullanıcı adı girilmediğinde bir hata mesajı gösterilebilir
                   return
               }
               
        openHome(with: username)
       
    }
    
    func openHome(with username: String) {
            let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
            homeVC.username = username // Kullanıcı adını HomeViewController'a aktar
            self.present(homeVC, animated: true, completion: nil)
        }

}
