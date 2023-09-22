//
//  LaunchScreen.swift
//  nuntium
//
//  Created by Peter Mumonyi on 19/09/2023.
//

import SwiftUI


 




class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a timer to delay the transition
        print("Launchscreen -- ")
        let delayInSeconds = 2.0 // Adjust the delay time as needed (in seconds)
        Timer.scheduledTimer(timeInterval: delayInSeconds, target: self, selector: #selector(self.navigateToOnboarding), userInfo: nil, repeats: false)
    }

    // Function to navigate to the onboarding screen
    @objc func navigateToOnboarding() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Onboarding") as! OnboardingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// In the first view controller

 
