//
//  BSMessagerateVC.swift
//  Billseye
//
//  Created by mac on 09/03/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class BSMessagerateVC: UIViewController {

    @IBOutlet weak var txtMessageRate: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setMsgAction(_ sender: Any)
    {
        let strRate = txtMessageRate.text
        
        UserDefaults.standard.set(strRate, forKey: "Msgrate")
        UserDefaults.standard.synchronize()
 
    }
    
    /*
    // MARK: - Navigation.,

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
