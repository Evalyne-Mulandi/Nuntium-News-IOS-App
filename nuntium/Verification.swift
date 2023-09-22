//
//  forgotPassword.swift
//  nuntium
//
//  Created by Peter Mumonyi on 20/09/2023.
//

import SwiftUI

struct Verification: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class VerificationviewController: UIViewController {
    
    @IBOutlet weak var confirm : UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a timer to delay the transition
        print("Veriification screen -- ")
     
    }
    
    @IBAction func navigateToverification() {
        print("Navigating")
        let storyboard: UIStoryboard = UIStoryboard(name: "NewPassword", bundle: nil)
        let  verificationViewController = storyboard.instantiateViewController(withIdentifier: "NewPassword")
        self.navigationController?.pushViewController(verificationViewController, animated: true)
    }
}




struct Verification_Previews: PreviewProvider {
    
    static var previews: some View {
        Verification()
    }
}
