//
//  BSHomeVC.swift
//  Billseye
//
//  Created by mac on 05/03/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class BSHomeVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    var window: UIWindow?
    
    @IBOutlet weak var ViewHome: UIView!
    var itemsCell = ["Call Logs","Rate", "March","Stats", "Export", "Contacts", "Keypad", "Setting","Messages","Invoice"]
    
    var itemsImg = ["ic_calllog_red_24dp","ic_doller_green_24dp", "ic_description_white_48dp","ic_chart_white_24dp", "ic_export_white_24dp", "ic_person_white_48dp", "ic_dialpad_white_48dp", "ic_settings_white_48dp","ic_message_white_48dp","ic_description_white_48dp"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                let bgRealState: UIImageView = UIImageView(frame: self.ViewHome.bounds)
                bgRealState.clipsToBounds = true
                bgRealState.contentMode = .scaleToFill
                bgRealState.image = UIImage.init(named: "grey_background_one")
                self.ViewHome.addSubview(bgRealState)
        
        
        print("Hello world")
        
        print("How r You???")
        

        let itemSize = UIScreen.main.bounds.width/2 - 1
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        myCollectionView.collectionViewLayout = layout
        
        
        
        let fileManager = FileManager.default
        let dirnum = FileManager.default.enumerator(atPath: "/private/")
        let nextItem = ""
        if let aObject = dirnum?.nextObject() as? String {
            while (nextItem == aObject) {
                if (URL(fileURLWithPath: nextItem).pathExtension == "db") || (URL(fileURLWithPath: nextItem).pathExtension == "sqlitedb") {
                    if fileManager.isReadableFile(atPath: nextItem) {
                        print("\(nextItem)")
                    }
                }
            }
        }

        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHomeView(toCreateOrder segue: UIStoryboardSegue)
    {
        
    }
 
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemsCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:BSHomeCVC=collectionView.dequeueReusableCell(withReuseIdentifier: "BSHomeCVC", for: indexPath) as! BSHomeCVC
        
        
      //  cell.LogoImg.image = itemsImg[indexPath.item]
        
        if indexPath.row == 2
        {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "d \nMMM \nyyyy"
            let result = formatter.string(from: date)
            
            cell.LblName.text = String(result)
        
        }
        else
        {
            cell.LblName.text = itemsCell[indexPath.item]
            cell.LogoImg.image = UIImage(named: self.itemsImg[indexPath.row])
        }
        
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        

        if indexPath.row == 0
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSCallLogsVC") as! BSCallLogsVC
            self.present(nextViewController, animated:true, completion:nil)
        }
        if indexPath.row == 1
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CallKitViewController") as! CallKitViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
        if indexPath.row == 2
        {
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSCalenderVC") as! BSCalenderVC
//            self.present(nextViewController, animated:true, completion:nil)
            
            self.window = UIWindow(frame: UIScreen.main.bounds)
            if let window = self.window {
                window.backgroundColor = UIColor.white
                let nav = UINavigationController()
                let mainView = CalenderVC()
                nav.viewControllers = [mainView]
                window.rootViewController = nav
                window.makeKeyAndVisible()
                UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : UIFont.monospacedDigitSystemFont(ofSize: 16, weight: UIFont.Weight.black)]
            }
            
        }
        if indexPath.row == 3
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSChartsVC") as! BSChartsVC
            self.present(nextViewController, animated:true, completion:nil)
        }
        
            if indexPath.row == 5
            {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSContactVC") as! BSContactVC
                self.present(nextViewController, animated:true, completion:nil)
            }
        if indexPath.row == 6
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSDialpadVC") as! BSDialpadVC
            self.present(nextViewController, animated:true, completion:nil)
        }
        if indexPath.row == 7
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSSettingVC") as! BSSettingVC
            self.present(nextViewController, animated:true, completion:nil)
        }
        if indexPath.row == 8
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSMessagesVC") as! BSMessagesVC
            self.present(nextViewController, animated:true, completion:nil)
        }
        if indexPath.row == 9
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BSInvoiceVC") as! BSInvoiceVC
            self.present(nextViewController, animated:true, completion:nil)
        }
    }
    
}


extension BSHomeVC :  UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 2.5
        let itemWidth = (collectionView.bounds.width - 5.0) / 2.0
        return CGSize(width: itemWidth, height: itemWidth)
    }
}



