//
//  AdventureChoice.swift
//  MyAdventure
//

import Foundation

struct AdventureChoice {
    let text: String
    let option1: String?
    let option2: String?
    let option1Next: Int?
    let option2Next: Int?
    let imageName: String

    func getNextStage(forOption option: Int) -> Int? {
        switch option {
        case 1:
            return option1Next
        case 2:
            return option2Next
        default:
            return nil
        }
    }
}
