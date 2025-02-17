//
//  Constants.swift
//  FlagChallenge
//
//  Created by Lena Soroka on 17.02.2025.
//

import Foundation

enum Constants {    
    enum Text {
        enum Start {
            static let start = "Start"
            static let initialText = "Welcome to the Flag Challenge. Here you can practice your knowledge of various coutries and their flags. \nLet's get started.\nPress Start to start the game."
        }
        
        enum Game {
            static let chooseCountry = "Choose correct country with such a flag:"
        }
        
        enum Finish {
            static let lastGameResults = "Last game results:"
            static var score: (Int) -> String = { score in
                return "Score: \(score)"
            }
        }
    }
    
    enum Toast {
        static let success = "Hooray! Well done!"
        static let failure = "It's wrong:(( But don't worry! You can do better!"
    }
}
