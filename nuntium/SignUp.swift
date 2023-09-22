//
//  forgotPassword.swift
//  nuntium
//
//  Created by Peter Mumonyi on 20/09/2023.
//

import SwiftUI

struct Signup: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class SignupviewController: UIViewController {
    
    @IBOutlet weak var signup : UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a timer to delay the transition
        print("Signup screen -- ")
     
    }
    
    @IBAction func navigateToverification() {
        print("Navigating")
        let storyboard: UIStoryboard = UIStoryboard(name: "FavTopics", bundle: nil)
        let  verificationViewController = storyboard.instantiateViewController(withIdentifier: "Fav")
        self.navigationController?.pushViewController(verificationViewController, animated: true)
    }
}




struct Signup_Previews: PreviewProvider {
    
    static var previews: some View {
        Signup()
    }
}
