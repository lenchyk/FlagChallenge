//
//  ContentView.swift
//  FlagChallenge
//
//  Created by Lena Soroka on 17.02.2025.
//

import SwiftUI

struct GameView: View {
    var viewModel: GameViewModelProtocol
    
    var body: some View {
        ZStack {
            starterView
                .opacity(viewModel.currentGameStep == nil ? 1 : 0)
                .animation(.spring(), value: viewModel.currentGameStep?.country)
            
            if let gameStep = viewModel.currentGameStep {
                gameView(for: gameStep)
            }
        }
        .padding()
        .overlay(alignment: .bottom) {
            toastView
                .opacity(viewModel.toastFeedback != nil ? 1 : 0)
                .animation(.easeInOut, value: viewModel.toastFeedback)
        }
    }
    
    // MARK: - Starter Views
    var starterView: some View {
        VStack(spacing: 48) {
            Text(Constants.Text.Start.initialText)
                .font(.title2)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            
            if !viewModel.isInitialGame {
                VStack(alignment: .leading) {
                    Text(Constants.Text.Finish.lastGameResults)
                        .bold()
                    Text(Constants.Text.Finish.score(viewModel.score))
                }
                .padding()
            }
            
            startButton
        }
        .padding(32)
    }
    
    var startButton: some View {
        Button {
            viewModel.startGame()
        } label: {
            Text(Constants.Text.Start.start)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .frame(minHeight: 60)
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(24)
        }
    }
    
    // MARK: - GameView
    func gameView(for step: GameStep) -> some View {
        VStack(spacing: 24) {
            Text(Constants.Text.Game.chooseCountry)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(.black)
                .multilineTextAlignment(.leading)
            
            Text(Country.ukraine.flag)
                .font(.largeTitle)
            
            VStack {
                ForEach(step.options, id: \.self) { country in
                    countryOptionButton(with: country)
                }
            }
        }
    }
    
    func countryOptionButton(with country: Country) -> some View {
        Button(action: { withAnimation { viewModel.choose(country: country) } }) {
            Text(country.name)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(.black)
                .frame(minHeight: 60)
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.4))
                .cornerRadius(24)
        }
    }
    
    // MARK: - ToastView
    var toastView: some View {
        Text(viewModel.toastFeedback ?? "")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.black)
            .frame(minHeight: 60)
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(24)
            .padding(.horizontal, 24)
    }
}

#Preview {
    GameView(viewModel: GameViewModel())
}
