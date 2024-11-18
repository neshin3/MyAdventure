//
//  ViewController.swift
//  MyAdventure
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    let adventureManager = AdventureManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func option1Tapped(_ sender: UIButton) {
        adventureManager.chooseOption(1)
        handleLogoVisibility() // Update logo visibility
        updateUI()
    }
    
    @IBAction func option2Tapped(_ sender: UIButton) {
        adventureManager.chooseOption(2)
        handleLogoVisibility() // Update logo visibility
        updateUI()
    }
    
    private func updateUI() {
        let currentChoice = adventureManager.getCurrentChoice()
        
        // Updates the story text
        storyLabel.text = currentChoice.text
        
        // Updates button titles or hides them
        if let option1 = currentChoice.option1 {
            option1Button.setTitle(option1, for: .normal)
            option1Button.isHidden = false
        } else {
            option1Button.isHidden = true
        }
        
        if let option2 = currentChoice.option2 {
            option2Button.setTitle(option2, for: .normal)
            option2Button.isHidden = false
        } else {
            option2Button.isHidden = true
        }
        
        backgroundImageView.image = UIImage(named: currentChoice.imageName)
        
        // makes logo visible on the first stage
        if adventureManager.getCurrentChoice().option1Next == 2 && adventureManager.getCurrentChoice().option2Next == 6 {
            logoImageView.isHidden = false
        }
    }
    
    // Hides the logo after transitioning from the first stage
    private func handleLogoVisibility() {
        if adventureManager.getCurrentChoice().option1Next != 2 || adventureManager.getCurrentChoice().option2Next != 6 {
            logoImageView.isHidden = true
        }
    }
}
