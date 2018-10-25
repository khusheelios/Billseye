//
//  BSCalenderVC.swift
//  Billseye
//
//  Created by mac on 13/03/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class BSCalenderVC: UIViewController {

    @IBOutlet weak var ViewHome: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgRealState: UIImageView = UIImageView(frame: self.ViewHome.bounds)
        bgRealState.clipsToBounds = true
        bgRealState.contentMode = .scaleAspectFill
        bgRealState.image = UIImage.init(named: "grey_background_one")
        self.ViewHome.addSubview(bgRealState)
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
