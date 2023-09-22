//
//  WelcomeScreen.swift
//  nuntium
//
//  Created by Peter Mumonyi on 19/09/2023.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class WelcomeScreenViewController: UIViewController {
    
    @IBOutlet weak var start : UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a timer to delay the transition
        print("Welcome screen -- ")
     
    }
    
    @IBAction func navigateToSignIn() {
        print("Navigating")
        let storyboard: UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
        let SignInController = storyboard.instantiateViewController(withIdentifier: "SignInViewControllerID")
        self.navigationController?.pushViewController(SignInController, animated: true)
    }
}





struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
