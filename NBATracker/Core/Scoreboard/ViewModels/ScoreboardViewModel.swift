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
    @Published var gameDate: Date = Date()
    
    private let scoreboardDataService = ScoreboardDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        $gameDate
            .sink { [weak self] gameDate in
                self?.reloadData(for: gameDate)
            }
            .store(in: &cancellables)
        
        // updates allScoreboards
        scoreboardDataService.$allScoreboards
            .sink { [weak self] (returnedScoreboard) in
                self?.allScoreboards = returnedScoreboard
//                self?.allScoreboards.append(contentsOf: [
//                    DeveloperPreview.instance.scoreboardNotStarted,
//                    DeveloperPreview.instance.scoreboardIsEndOfPeriod,
//                    DeveloperPreview.instance.scoreboardIsPlaying,
//                    DeveloperPreview.instance.scoreboardIsHalftime,
//                    DeveloperPreview.instance.scoreboardIsFinished,
//                ])
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    func reloadData(for date: Date = Date()) {
        isLoading = true
        scoreboardDataService.getScoreboards(for: date)
        HapticManager.notification(type: .success)
    }
}
