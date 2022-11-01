//
//  FeedViewController.swift
//  Chasm
//
//  Created by Nick Melkadze on 10/27/22.
//  Updated by Georgina Woo on 10/28/22.

import UIKit
import AlamofireImage
import Parse
import MessageInputBar

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MessageInputBarDelegate {
    
    let commentBar = MessageInputBar()
    var showsCommentBar = false
    var posts = [PFObject]() //post of arrays, an empty array
    var numberOfPosts: Int!
    var selectedPost: PFObject!
    let myRefreshControl = UIRefreshControl()
    
    /*
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
    */
    
    
    override var inputAccessoryView: UIView?
    {
        return commentBar
    }
    
    override var canBecomeFirstResponder: Bool
    {
        return showsCommentBar
    }

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentBar.inputTextView.placeholder = "Comment on this rock..."
        commentBar.sendButton.title = "Post"
        commentBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .interactive
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        myRefreshControl.addTarget(self, action: #selector(viewDidAppear), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
        // Do any additional setup after loading the view.
    }
    @objc func keyboardWillBeHidden(note: Notification)
    {
        commentBar.inputTextView.text = nil
        showsCommentBar = false
        becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        numberOfPosts = 20
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        
        query.includeKeys(["author", "comment", "comment.author"])
        query.limit = numberOfPosts
        query.order(byDescending : "createdAt")
        query.findObjectsInBackground{ (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
                self.myRefreshControl.endRefreshing()
            }
        }
    }
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        // Create the comment
        let comment = PFObject(className: "Comments")
        
        comment["text"] = text
        comment["post"] = selectedPost
        comment["author"] = PFUser.current()!
        
        selectedPost.add(comment, forKey: "comment")
        
        selectedPost.saveInBackground{ (success, error) in
            if success{
                print("Comment saved")
            } else {
                print("Error saving comment")
            }
        }
        
        tableView.reloadData()
         
        
        // Clear and dismiss the input bar
        commentBar.inputTextView.text = nil
        showsCommentBar = false
        becomeFirstResponder()
        commentBar.inputTextView.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let post = posts[section]
        let comments = (post["comment"] as? [PFObject]) ?? []
        
        return comments.count + 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.section]
        let comments = (post["comment"] as? [PFObject]) ?? []
        
        if indexPath.row == 0
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
            
            let user = post["author"] as! PFUser
            cell.usernameLabel.text = user.username
            cell.captionLabel.text = post["caption"] as? String
            
            let imageFile = post["image"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            cell.photoView.af.setImage(withURL: url)
            return cell
            
            
        }
        /*
        else if indexPath.row > captions.count
        {
            print("got here", indexPath.row, captions.count)
            let caption = tableView.dequeueReusableCell(withIdentifier: "CaptionCell") as! CaptionCell
            let user = post["author"] as! PFUser
            caption.usernameLabel.text = user.username
            caption.captionLabel.text = post["caption"] as? String
            return caption
        }
         */
        else if indexPath.row <= comments.count
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
            let comment = comments[indexPath.row - 1]
            cell.commentLabel.text = comment["text"] as? String
            
            let user = comment["author"] as! PFUser
            cell.nameLabel.text = user.username
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCommentCell")!
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let post = posts[indexPath.section]
        let comments  = (post["comment"] as? [PFObject]) ?? []
        
        if indexPath.row == comments.count + 1
        {
            showsCommentBar = true
            becomeFirstResponder()
            commentBar.inputTextView.becomeFirstResponder()
            
            selectedPost = post
        }
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
