//
//  GameViewModel.swift
//  FlagChallenge
//
//  Created by Lena Soroka on 17.02.2025.
//

import Foundation

protocol GameViewModelProtocol {
    var isInitialGame: Bool { get }
    var score: Int { get }
    var currentGameStep: GameStep? { get }
    var toastFeedback: String? { get }
     
    func startGame()
    func choose(country: Country)
}

class GameViewModel: GameViewModelProtocol, ObservableObject {
    @Published var toastFeedback: String?
    @Published var currentGameStep: GameStep?
    
    var isInitialGame: Bool = true
    var score: Int = 0
    
    private var gameSteps: [GameStep] = []
    private var stepCount: Int = 0
    private let flagGameService: FlagGaming
    
    init() { 
        flagGameService = FlagGameService()
    }
    
    func startGame() {
        gameSteps.removeAll()
        score = 0
        gameSteps = flagGameService.startNewGame()
        currentGameStep = gameSteps.first
        print("Here is your game \(gameSteps)")
    }
    
    func choose(country: Country) {
        toastFeedback = country == currentGameStep?.country ? Constants.Toast.success : Constants.Toast.failure
        
        if stepCount != gameSteps.count {
            print("Here is counter \(stepCount)")
            stepCount += 1
            print("Here is after counter \(stepCount)")
            currentGameStep = gameSteps[stepCount]
        } else {
            currentGameStep = nil
            stepCount = 0
            isInitialGame = false
        }
    }
}

