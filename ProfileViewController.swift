//
//  ProfileViewController.swift
//  Chasm
//
//  Created by Nick Melkadze on 10/29/22.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {
    
    var posts = [PFObject]()

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBAction func backToHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        renderProfile()
    }
    
    func renderProfile() {
        let user = PFUser.current()!
        usernameLabel.text = user.username!
        
        let query = PFQuery(className: "Posts")
        query.includeKeys(["author"])
        query.whereKey("author", equalTo: user)
        query.findObjectsInBackground{ (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.postsLabel.text = String(self.posts.count)
                
                if self.posts.count >= 100 {
                    self.levelLabel.text = "Top of the Rock"
                } else if self.posts.count >= 75{
                    self.levelLabel.text = "Mineral Monster"
                } else if self.posts.count >= 50 {
                    self.levelLabel.text = "Rock Pro"
                } else if self.posts.count >= 25 {
                    self.levelLabel.text = "Sample Seeker"
                } else if self.posts.count >= 10{
                    self.levelLabel.text = "Stone Forager"
                } else if self.posts.count >= 5{
                    self.levelLabel.text = "Rock Beginner"
                } else if self.posts.count >= 1 {
                    self.levelLabel.text = "Single-Stone Collector"
                } else {
                    self.levelLabel.text = "Not a Rock Fan"
                }
            }
        }
        
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
