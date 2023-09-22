//
//  SignIn.swift
//  nuntium
//
//  Created by Peter Mumonyi on 19/09/2023.
//

import SwiftUI

struct SignIn: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}



class SignInViewController: UIViewController {
    @IBOutlet weak var forgot : UIButton!
    
    @IBOutlet weak var sign : UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a timer to delay the transition
      
    }
    
    @IBAction func navigateToForgotPassword() {
        
//        let  ForgotPasswordViewController = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewControllerID")
        print("Navigating")
        let storyboard: UIStoryboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
        let forgotPasswordController = storyboard.instantiateViewController(withIdentifier: "ForgotPassword")
        self.navigationController?.pushViewController(forgotPasswordController, animated: true)
    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
