//
//  BSMessagesVC.swift
//  Billseye
//
//  Created by mac on 07/03/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class BSMessagesVC: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var ViewHome: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var strRate:String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let bgRealState: UIImageView = UIImageView(frame: self.ViewHome.bounds)
        bgRealState.clipsToBounds = true
        bgRealState.contentMode = .scaleAspectFill
        bgRealState.image = UIImage.init(named: "grey_background_one")
        self.ViewHome.addSubview(bgRealState)
        
        
        let defaults = UserDefaults.standard
        
        if (defaults.object(forKey: "Msgrate") != nil) {
            strRate = defaults.string(forKey: "Msgrate")
        }
        
        
          
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return 5
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
        let   cell = tableView.dequeueReusableCell(withIdentifier: "BSMessagesTVC", for: indexPath) as! BSMessagesTVC
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 300, y: 600, width: 50, height: 50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.backgroundColor = UIColor.darkGray
        button.setImage(UIImage(named:"ic_add_white_24dp"), for: .normal)
        button.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        
        return cell
    }
    
    @objc func thumbsUpButtonPressed()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSSendMessagesVC") as! BSSendMessagesVC
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    
}

