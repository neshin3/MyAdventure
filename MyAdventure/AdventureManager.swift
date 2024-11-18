//
//  AdventureManager.swift
//  MyAdventure
//

import Foundation

class AdventureManager {
    
    // Declare the story dictionary
    private var story: [Int: AdventureChoice] = [:]
    
    // Declares the current stage
    private var currentStage: Int = 1
    
    init() {
        setupStory()
    }
    
    func chooseOption(_ option: Int) {
        if let next = story[currentStage]?.getNextStage(forOption: option) {
            currentStage = next
        }
    }
    
    // Gets the current choice
    func getCurrentChoice() -> AdventureChoice {
        return story[currentStage]!
    }
    
    // Initializes the story data
    private func setupStory() {
        story[1] = AdventureChoice(
            text: "You stumble across an entrance to an abandoned cave. Do you enter?",
            option1: "Yes, enter the cave",
            option2: "No, walk away",
            option1Next: 2,
            option2Next: 6,
            imageName: "background"
        )
        
        story[2] = AdventureChoice(
            text: "Inside, you spot two treasure chests with a warning: 'Not all is what it appears. Choose wisely.' Which chest do you open?",
            option1: "Left chest",
            option2: "Right chest",
            option1Next: 3,
            option2Next: 4,
            imageName: "Enter"
        )
        
        story[3] = AdventureChoice(
            text: "The chest is a mimic! Game Over.",
            option1: "Restart",
            option2: nil,
            option1Next: 1,
            option2Next: nil,
            imageName: "Mimic"
        )
        
        story[4] = AdventureChoice(
            text: "Congratulations! You hit the mother lode. Do you open the other chest?",
            option1: "Yes, open the other chest",
            option2: "No, leave with your treasure",
            option1Next: 3,
            option2Next: 5,
            imageName: "OpenChest"
        )
        
        story[5] = AdventureChoice(
            text: "Wise choice! You avoid unnecessary danger and enjoy your newfound wealth.",
            option1: "Restart",
            option2: nil,
            option1Next: 1,
            option2Next: nil,
            imageName: "Home"
        )
        
        story[6] = AdventureChoice(
            text: "It’s getting late, and dinner is probably ready. Do you think about returning to the cave later?",
            option1: "Yes, go back to the cave",
            option2: "No, dinner is more important",
            option1Next: 2,
            option2Next: 7,
            imageName: "Home"
        )
        
        story[7] = AdventureChoice(
            text: "You’ll never know what was in the cave, but at least you made it to dinner on time.",
            option1: "Start Over",
            option2: nil,
            option1Next: 1,
            option2Next: nil,
            imageName: "Home"
        )
    }
}
