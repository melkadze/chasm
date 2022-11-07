//
//  PostCell.swift
//  Chasm
//
//  Created by odell francis on 10/27/22.
//

import UIKit
import Parse

class PostCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBAction func favoritePost(_ sender: Any) {
        // Does not work currently
        
        let favorite = PFObject(className: "Favorites")
        
        //favorite["post"] = selectedPost!
        favorite["user"] = PFUser.current()!
        
        //selectedPost.add(favorite, forKey: "favorite")
        
        favorite.saveInBackground { sucess, error in
            if(sucess){
                //selectedPost.setFavorite(true)
                print("Favorite set successfully!")
            }
            else{
                print("Error! Favorite set failed")
            }
        }
    }
    
    var favoriteed:Bool = false
    
    func setFavorite(_ isFavorited:Bool){
        favoriteed = isFavorited
        
        if(favoriteed){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
