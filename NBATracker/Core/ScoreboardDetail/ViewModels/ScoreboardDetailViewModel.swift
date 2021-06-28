//
//  ScoreboardDetailViewModel.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-21.
//

import Foundation
import Combine

class ScoreboardDetailViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var scoreboard: Scoreboard
    @Published var allTeamStats: [GameStatistic<(Int, Int)>] = []
    
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
            .sink(receiveValue: { [weak self] (returnedTeamStatistics) in
                self?.allTeamStats = returnedTeamStatistics
                self?.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    private func mapBoxscoreToStatistics(boxscore: Boxscore?) -> [GameStatistic<(Int, Int)>] {
        
        if let boxscore = boxscore {
            
            let assistsStat = GameStatistic(title: "Assists", value: (boxscore.homeTeam.assists, boxscore.visitorTeam.assists))
            
            let totalReboundsStat = GameStatistic(title: "Total Rebounds", value: (boxscore.homeTeam.totReb, boxscore.visitorTeam.totReb))
            
            let offReboundsStat = GameStatistic(title: "Offensive Rebounds", value: (boxscore.homeTeam.offReb, boxscore.visitorTeam.offReb))
            
            let stealsStat = GameStatistic(title: "Steals", value: (boxscore.homeTeam.steals, boxscore.visitorTeam.steals))
            
            let blocksStat = GameStatistic(title: "Blocks", value: (boxscore.homeTeam.blocks, boxscore.visitorTeam.blocks))
            
            let fastBreakPointsStat = GameStatistic(title: "Fastbreak Points", value: (boxscore.homeTeam.fastBreakPoints, boxscore.visitorTeam.fastBreakPoints))
            
            let pointsInPaintStat = GameStatistic(title: "Points in the Paint", value: (boxscore.homeTeam.pointsInPaint, boxscore.visitorTeam.pointsInPaint))
            
            let secondChancePointsStat = GameStatistic(title: "Second chance Points", value: (boxscore.homeTeam.secondChancePoints, boxscore.visitorTeam.secondChancePoints))
            
            let pointsOffTurnoversStat = GameStatistic(title: "Points off Turnovers", value: (boxscore.homeTeam.pointsOffTurnovers, boxscore.visitorTeam.pointsOffTurnovers))
            
            let turnoversStat = GameStatistic(title: "Turnovers", value: (boxscore.homeTeam.turnovers, boxscore.visitorTeam.turnovers))
            
            let personalFoulsStat = GameStatistic(title: "Personal Fouls", value: (boxscore.homeTeam.pFouls, boxscore.visitorTeam.pFouls))
            
            let teamFoulsStat = GameStatistic(title: "Team Fouls", value: (boxscore.homeTeam.teamFouls, boxscore.visitorTeam.teamFouls))
            
            let allTeamStats = [
                assistsStat,
                totalReboundsStat,
                offReboundsStat,
                stealsStat,
                blocksStat,
                fastBreakPointsStat,
                pointsInPaintStat,
                secondChancePointsStat,
                pointsOffTurnoversStat,
                turnoversStat,
                personalFoulsStat,
                teamFoulsStat,
            ]
            return allTeamStats
        } else {
            return []
        }
    }
    
    func reloadData() {
        self.isLoading = true
        self.boxscoreDataService.getBoxscore()
        HapticManager.notification(type: .success)
    }
}
