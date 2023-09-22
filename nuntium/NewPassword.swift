//
//  forgotPassword.swift
//  nuntium
//
//  Created by Peter Mumonyi on 20/09/2023.
//

import SwiftUI

struct NewPassword: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class NewPasswordviewController: UIViewController {
    
    @IBOutlet weak var confirm : UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a timer to delay the transition
        print("Signup screen -- ")
     
    }
    
    @IBAction func navigateToverification() {
        print("Navigating")
        let storyboard: UIStoryboard = UIStoryboard(name: "Signup", bundle: nil)
        let  verificationViewController = storyboard.instantiateViewController(withIdentifier: "Signup")
        self.navigationController?.pushViewController(verificationViewController, animated: true)
    }
}




struct NewPassword_Previews: PreviewProvider {
    
    static var previews: some View {
        NewPassword()
    }
}
