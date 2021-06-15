//
//  ScoreboardViewModel.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-15.
//

import Foundation
import Combine

class ScoreboardViewModel: ObservableObject {
    
    @Published var allScoreboards: [Scoreboard] = []
    
    @Published var isLoading: Bool = false
    
    private let scoreboardDataService = ScoreboardDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates allScoreboards
        scoreboardDataService.$allScoreboards
        .sink { [weak self] (returnedScoreboard) in
            self?.allScoreboards = returnedScoreboard
        }
        .store(in: &cancellables)
    }
    
    func reloadData() {
        isLoading = true
        scoreboardDataService.getScoreboards()
    }
}
