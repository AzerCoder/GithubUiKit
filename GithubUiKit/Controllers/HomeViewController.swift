//
//  HomeViewController.swift
//  GithubUiKit
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var biotext: UILabel!
    
    var username: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserData()
    }
    
    
    
     func fetchUserData() {
        let username = username
        let url = URL(string: "https://api.github.com/users/\(username)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error!)")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let userData = try decoder.decode(User.self, from: data)
                
                DispatchQueue.main.async {
                    self.updateUI(with: userData)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    
    
    private func updateUI(with user: User){

            name.text = user.name ?? "N/A"
            login.text = user.login
            followers.text = "Followers: \(user.followers)"
            following.text = "Following: \(user.following)"
            location.text = "\(user.location ?? "N/A")"
            company.text = "\(user.company ?? "N/A")"
            biotext.text = "\(user.bio ?? "N/A")"
    }
}

