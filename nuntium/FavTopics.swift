//
//  FavTopics.swift
//  nuntium
//
//  Created by Peter Mumonyi on 18/09/2023.
//

import UIKit
import SwiftUI

class FavTopics: UIViewController {
    @IBOutlet weak var selectLbl : UILabel!
    @IBOutlet weak var selectDescriptionLbl : UILabel!
    
    @IBOutlet var buttons : [UIButton]!
    var clickedButtonTags = Set<Int>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedButtonTags = UserDefaults.standard.array(forKey: "ClickedButtonTags") as? [Int]{
            clickedButtonTags = Set(savedButtonTags)
        }
        
        //Initialize button colors based on the loaded tags
        for button in buttons {
            if clickedButtonTags.contains(button.tag){
                button.backgroundColor = UIColor(named: "buttonClickedColor")
                button.setTitleColor(UIColor.white, for: .normal)
            } else {
                button.backgroundColor = UIColor(named: "buttonDefaultColor")
                button.setTitleColor(UIColor.black, for: .normal)
            }
            
            //Add target action to the buttons
            button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonClicked(_ sender: UIButton){
        //Toggle the buttons color based on its current state
        if sender.backgroundColor == UIColor(named: "buttonDefaultColor"){
            sender.backgroundColor = UIColor(named: "buttonClickedColor")
            sender.setTitleColor(UIColor.white, for: .normal)
            
            clickedButtonTags.insert(sender.tag)
        } else {
            sender.backgroundColor = UIColor(named: "buttonDefaultColor")
            sender.setTitleColor(UIColor.black, for: .normal)
            clickedButtonTags.remove(sender.tag)
        }
        
        //Save the clicked button tags to User Defaults
        UserDefaults.standard.set(Array(clickedButtonTags), forKey: "ClickedButtonTags")
    }
    
    @IBAction func navigateToHomePage() {
        
//        let  ForgotPasswordViewController = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewControllerID")
        print("Navigating to Home")
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let articleController = storyboard.instantiateViewController(withIdentifier: "HomePage")
        self.navigationController?.pushViewController(articleController, animated: true)
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
