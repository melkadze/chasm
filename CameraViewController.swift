//
//  CameraViewController.swift
//  Chasm
//
//  Created by odell francis on 10/27/22.
//

import UIKit
import Parse
import AlamofireImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentField: UITextField!
    
    @IBAction func onSubmitButton(_ sender: Any) {
        
        let post = PFObject(className: "Posts")//A new table/ catagory
        
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()!
        
        let imageData = imageView.image!.pngData()//data saved as png
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        post["image"] = file//
        
        post.saveInBackground { sucess, error in
            if(sucess){
                self.dismiss(animated: true, completion: nil)//leave's view if sucessful
                print("post saved!")
            }
            else{
                print("errpr post did not save")
            }
        }
        
    }
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self//let when user is done with photo lets function know what they took
        picker.allowsEditing = true//presents second screen to user after take the photo and allow to edit
        //This method is not very customizable
        
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){//Checks if camera is available
            picker.sourceType = .camera//will by default open camera if using with real phone
        }
        else{
            picker.sourceType = .photoLibrary//else if not then use simulator photo libary
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage//dictionary cast
        
        let size = CGSize(width: 300, height: 300)//Allow for resizing
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage //sets the image to display in the current imageView
        
        dismiss(animated: true, completion: nil)//dismiss camera view / close it
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
