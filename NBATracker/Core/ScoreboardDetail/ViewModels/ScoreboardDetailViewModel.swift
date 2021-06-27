//
//  ScoreboardDetailViewModel.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-21.
//

import Foundation
import Combine

class ScoreboardDetailViewModel: ObservableObject {
    
    @Published var scoreboard: Scoreboard
    @Published var gameStatistics: [GameStatistic] = []
    
    private let boxscoreDataService: BoxscoreDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(scoreboard: Scoreboard) {
        self.scoreboard = scoreboard
        self.boxscoreDataService = BoxscoreDataService(gameDate: scoreboard.startTimeDate, gameId: scoreboard.id)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        boxscoreDataService.$boxscore
            .map(mapBoxscoreToStatistics)
            .sink(receiveValue: { [weak self] (returnedStatistics) in
                self?.gameStatistics = returnedStatistics
            })
            .store(in: &cancellables)
    }
    
    private func mapBoxscoreToStatistics(boxscore: Boxscore?) -> [GameStatistic] {
        if let boxscore = boxscore {
            print(boxscore)
        } else {
            print("No boxscore")
        }
        return []
    }
}
