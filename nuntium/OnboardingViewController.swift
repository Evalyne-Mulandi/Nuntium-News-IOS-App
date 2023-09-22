//
//  onboarding.swift
//  nuntium
//
//  Created by Peter Mumonyi on 19/09/2023.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
         

        }
    }
class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var nextButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a timer to delay the transition
        print("Onboarding screen -- ")
     
    }
    
    @IBAction func navigateToWelcomeScreen(_sender:UIButton) {
        print( "navigateToWelcomeScreen,navigating to welcome screen")
        let storyboard: UIStoryboard = UIStoryboard(name: "WelcomeScreen", bundle: nil)
        let WelcomeScreenViewController = storyboard.instantiateViewController(withIdentifier: "WelcomeScreen")
        
//
        
        self.navigationController?.pushViewController(WelcomeScreenViewController, animated: true)
    }
}

 


struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}


