//
//  FlagGameService.swift
//  FlagChallenge
//
//  Created by Lena Soroka on 17.02.2025.
//

import Foundation

protocol FlagGaming {
    func startNewGame() -> [GameStep]
}

class FlagGameService: FlagGaming {
    enum Constants {
        static let kNumberSteps = 5
        static let kNumberOptions = 3
    }
    
    func startNewGame() -> [GameStep] {
        var steps: [GameStep]  = []
        
        for step in 0..<Constants.kNumberSteps {
            let options = Country.allCases.shuffled().prefix(Constants.kNumberOptions)
            let randomIndex = Int.random(in: 0...2)
            let country = options[randomIndex]
            steps.append(.init(country: country, options: Array(options)))
        }
        
        return steps
    }
}
