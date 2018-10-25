//
//  BSSettingVC.swift
//  Billseye
//
//  Created by mac on 07/03/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class BSSettingVC: UIViewController {

    @IBOutlet weak var viewHome: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgRealState: UIImageView = UIImageView(frame: viewHome.bounds)
        bgRealState.clipsToBounds = true
        bgRealState.contentMode = .scaleAspectFill
        bgRealState.image = UIImage.init(named: "grey_background_one")
        viewHome.addSubview(bgRealState)
        
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
