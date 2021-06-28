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
    @Published var allTeamGeneralStats: [GameStatistic<(Int, Int)>] = []
    @Published var allTeamShootingStats: [GameStatistic<(home: (made: Int, attempted: Int, percentage: Double),
                                                         visitor: (made: Int, attempted: Int, percentage: Double))>] = []
    
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
                guard let self = self else { return }
                self.allTeamGeneralStats = returnedTeamStatistics.generalStats
                self.allTeamShootingStats = returnedTeamStatistics.shootingStats
                self.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    private func mapBoxscoreToStatistics(boxscore: Boxscore?) -> (generalStats: [GameStatistic<(Int, Int)>], shootingStats: [GameStatistic<(home: (made: Int, attempted: Int, percentage: Double), visitor: (made: Int, attempted: Int, percentage: Double))>]) {
        
        var teamGeneralStats: [GameStatistic<(Int, Int)>] = []
        var teamShootingStats: [GameStatistic<(home: (made: Int, attempted: Int, percentage: Double),
                                               visitor: (made: Int, attempted: Int, percentage: Double))>] = []
        
        if let boxscore = boxscore {
            
            // MARK: General Stats
            let assistsStat = GameStatistic(title: "Assists", value: (boxscore.homeTeam.assists, boxscore.visitorTeam.assists))
            
            let totalReboundsStat = GameStatistic(title: "Total Rebounds", value: (boxscore.homeTeam.totReb, boxscore.visitorTeam.totReb))
            
            let offReboundsStat = GameStatistic(title: "Offensive Rebounds", value: (boxscore.homeTeam.offReb, boxscore.visitorTeam.offReb))
            
            let stealsStat = GameStatistic(title: "Steals", value: (boxscore.homeTeam.steals, boxscore.visitorTeam.steals))
            
            let blocksStat = GameStatistic(title: "Blocks", value: (boxscore.homeTeam.blocks, boxscore.visitorTeam.blocks))
            
            let fastBreakPointsStat = GameStatistic(title: "Fastbreak Points", value: (boxscore.homeTeam.fastBreakPoints, boxscore.visitorTeam.fastBreakPoints))
            
            let pointsInPaintStat = GameStatistic(title: "Points in the Paint", value: (boxscore.homeTeam.pointsInPaint, boxscore.visitorTeam.pointsInPaint))
            
            let secondChancePointsStat = GameStatistic(title: "Second Chance Points", value: (boxscore.homeTeam.secondChancePoints, boxscore.visitorTeam.secondChancePoints))
            
            let pointsOffTurnoversStat = GameStatistic(title: "Points Off Turnovers", value: (boxscore.homeTeam.pointsOffTurnovers, boxscore.visitorTeam.pointsOffTurnovers))
            
            let turnoversStat = GameStatistic(title: "Turnovers", value: (boxscore.homeTeam.turnovers, boxscore.visitorTeam.turnovers))
            
            let personalFoulsStat = GameStatistic(title: "Personal Fouls", value: (boxscore.homeTeam.pFouls, boxscore.visitorTeam.pFouls))
            
            let teamFoulsStat = GameStatistic(title: "Team Fouls", value: (boxscore.homeTeam.teamFouls, boxscore.visitorTeam.teamFouls))
            
            teamGeneralStats.append(contentsOf: [
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
            ])
            
            // MARK: Shooting stats
            let fieldGoalsHome = (made: boxscore.homeTeam.fgm, attempted: boxscore.homeTeam.fga, percentage: boxscore.homeTeam.fgp)
            let fieldGoalsVisitor = (made: boxscore.visitorTeam.fgm, attempted: boxscore.visitorTeam.fga, percentage: boxscore.visitorTeam.fgp)
            let fieldGoalsStat = GameStatistic(title: "Field Goals", value: (home: fieldGoalsHome, visitor: fieldGoalsVisitor))
            
            let threePointsHome = (made: boxscore.homeTeam.tpm, attempted: boxscore.homeTeam.tpa, percentage: boxscore.homeTeam.tpp)
            let threePointsVisitor = (made: boxscore.visitorTeam.tpm, attempted: boxscore.visitorTeam.tpa, percentage: boxscore.visitorTeam.tpp)
            let threePointsStat = GameStatistic(title: "Three Points", value: (home: threePointsHome, visitor: threePointsVisitor))
            
            let freeThrowsHome = (made: boxscore.homeTeam.ftm, attempted: boxscore.homeTeam.fta, percentage: boxscore.homeTeam.ftp)
            let freeThrowsVisitor = (made: boxscore.visitorTeam.ftm, attempted: boxscore.visitorTeam.fta, percentage: boxscore.visitorTeam.ftp)
            let freeThrowsStat = GameStatistic(title: "Free Throws", value: (home: freeThrowsHome, visitor: freeThrowsVisitor))
            
            teamShootingStats.append(contentsOf: [
                fieldGoalsStat,
                threePointsStat,
                freeThrowsStat,
            ])
            print(teamShootingStats)
        }
        return (generalStats: teamGeneralStats, shootingStats: teamShootingStats)
    }
    
    func reloadData() {
        self.isLoading = true
        self.boxscoreDataService.getBoxscore()
        HapticManager.notification(type: .success)
    }
}
