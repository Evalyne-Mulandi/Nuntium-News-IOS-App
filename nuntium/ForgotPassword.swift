//
//  forgotPassword.swift
//  nuntium
//
//  Created by Peter Mumonyi on 20/09/2023.
//

import SwiftUI

struct ForgotPassword: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var forgot : UIButton!
    
    @IBOutlet weak var forgotPwdBg : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a timer to delay the transition
        print("Forgot Password screen -- ")
        
        DispatchQueue.main.async {
            self.forgotPwdBg.layer.cornerRadius = 12
        }
     
    }
    
    @IBAction func navigateToverification() {
        print("Navigating")
        let storyboard: UIStoryboard = UIStoryboard(name: "Verification", bundle: nil)
        let  verificationViewController = storyboard.instantiateViewController(withIdentifier: "Verification")
        self.navigationController?.pushViewController(verificationViewController, animated: true)
    }
}




struct ForgotPassword_Previews: PreviewProvider {
    
    static var previews: some View {
        ForgotPassword()
    }
}
