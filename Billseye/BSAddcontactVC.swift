//
//  BSAddcontactVC.swift
//  Billseye
//
//  Created by mac on 07/03/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class BSAddcontactVC: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate  {

    @IBOutlet weak var viewHome: UIView!

    @IBOutlet weak var btnImgPicker: UIButton!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobNo: UITextField!
    @IBOutlet weak var txtPhNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtJobTitle: UITextField!
    
    var strName = String()
    var strMobNo = String()
    var strPhNo = String()
    var strEmail = String()
    var strAddress = String()
    var strJobTitle = String()
    
    var myView: BounceSuccessfulView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgRealState: UIImageView = UIImageView(frame: viewHome.bounds)
        bgRealState.clipsToBounds = true
        bgRealState.contentMode = .scaleAspectFill
        bgRealState.image = UIImage.init(named: "grey_background_one")
        viewHome.addSubview(bgRealState)
        
        
        //BOUNCE VIEW
        myView = BounceSuccessfulView(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 30))
        myView?.center = view.center
        view.addSubview(myView!)
        
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BSAddcontactVC.dismissController))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func dismissController(gesture: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    

    // Start Editing The Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if (textField == txtPhNo)
        {
            moveTextField(textField, moveDistance: -75, up: true)
        }
        else if (textField == txtEmail)
        {
            moveTextField(textField, moveDistance: -155, up: true)
        }
        else if (textField == txtAddress)
        {
            moveTextField(textField, moveDistance: -270, up: true)
        }
        else if (textField == txtJobTitle)
        {
            moveTextField(textField, moveDistance: -270, up: true)
        }
        
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if (textField == txtPhNo)
        {
            moveTextField(textField, moveDistance: -75, up: false)
        }
        else if (textField == txtEmail)
        {
            moveTextField(textField, moveDistance: -155, up: false)
        }
        else if (textField == txtAddress)
        {
            moveTextField(textField, moveDistance: -270, up: false)
        }
        else if (textField == txtJobTitle)
        {
            moveTextField(textField, moveDistance: -270, up: false)
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ImgPicker(_ sender: Any) {
        print("imag")
        let image = UIImagePickerController()
        image.delegate=self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
            (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                image.sourceType = .camera
                self.present(image, animated: true, completion: nil)
            }else{
                print("camera is not available")
            }
            
        }))
        
       
        actionSheet.addAction(UIAlertAction(title: "Photo Libaray", style: .default, handler: {
            (action:UIAlertAction) in
            
            //image.sourceType=UIImagePickerControllerSourceType.photoLibrary
            image.sourceType = .photoLibrary
            self.present(image, animated: true, completion: nil)
            image.allowsEditing=true
        }))
        actionSheet.addAction(UIAlertAction(title:"Cancel",style:.cancel,handler:nil))
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.dismiss(animated: true, completion: nil)
        //        myImageView.image = selectedImage
        //
        //        btnImage.isHidden = true
        
        let imageData:NSData =  UIImageJPEGRepresentation(selectedImage, 0.2)! as NSData
        
        btnImgPicker.setImage(( selectedImage), for: UIControlState.normal)
        
        //   let imageData = selectedImage.lowestQualityJPEGNSData
        
        
      
            
        }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func AddContactAction(_ sender: Any)
    {
        strName = txtName.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        strMobNo = txtMobNo.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        strPhNo = txtPhNo.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        strEmail = txtEmail.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        strAddress = txtAddress.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        strJobTitle = txtJobTitle.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
   
        
        if((strName.isEmpty) || (strMobNo.isEmpty))
        {
            
            if (strName.isEmpty) {
                myView?.textLabel?.text = "Please Enter The Name";
                myView!.startAnimation()
                txtName.resignFirstResponder()
            }
            else if (strMobNo.isEmpty) {
                myView?.textLabel?.text = "Please Enter The Mobile No";
                myView!.startAnimation()
                txtMobNo.resignFirstResponder()
            }
            
        }
        else
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSContactVC") as! BSContactVC
            self.present(nextViewController, animated:true, completion:nil)
        }
    
    
        
        
        
        
        
        
        
    }
    
    
    

}
    

