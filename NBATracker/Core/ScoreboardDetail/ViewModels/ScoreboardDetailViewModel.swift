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
    @Published var allTeamLeadersStats: [GameStatistic<(home: StatLeader, visitor: StatLeader)>] = []
    
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
                self.allTeamLeadersStats = returnedTeamStatistics.leadersStats
                self.isLoading = false
            })
            .store(in: &cancellables)
        
        boxscoreDataService.$scoreboard
            .sink(receiveValue: { [weak self] (returnedScoreboard) in
                guard let self = self else { return }
                self.scoreboard = returnedScoreboard ?? self.scoreboard
                self.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    private func mapBoxscoreToStatistics(boxscore: Boxscore?) -> (generalStats: [GameStatistic<(Int, Int)>],
                                                                  shootingStats: [GameStatistic<(home: (made: Int, attempted: Int, percentage: Double), visitor: (made: Int, attempted: Int, percentage: Double))>],
                                                                  leadersStats: [GameStatistic<(home: StatLeader, visitor: StatLeader)>]) {
        
        var teamGeneralStats: [GameStatistic<(Int, Int)>] = []
        var teamShootingStats: [GameStatistic<(home: (made: Int, attempted: Int, percentage: Double),
                                               visitor: (made: Int, attempted: Int, percentage: Double))>] = []
        
        var teamLeadersStats: [GameStatistic<(home: StatLeader, visitor: StatLeader)>] = []
        
        if let boxscore = boxscore {
            //MARK: - Team Game Stats
            // MARK: General Stats
            let assistsStat = GameStatistic(title: "Assists", value: (boxscore.homeTeam.teamGameStats.assists, boxscore.visitorTeam.teamGameStats.assists))
            
            let totalReboundsStat = GameStatistic(title: "Total Rebounds", value: (boxscore.homeTeam.teamGameStats.totReb, boxscore.visitorTeam.teamGameStats.totReb))
            
            let offReboundsStat = GameStatistic(title: "Offensive Rebounds", value: (boxscore.homeTeam.teamGameStats.offReb, boxscore.visitorTeam.teamGameStats.offReb))
            
            let stealsStat = GameStatistic(title: "Steals", value: (boxscore.homeTeam.teamGameStats.steals, boxscore.visitorTeam.teamGameStats.steals))
            
            let blocksStat = GameStatistic(title: "Blocks", value: (boxscore.homeTeam.teamGameStats.blocks, boxscore.visitorTeam.teamGameStats.blocks))
            
            let fastBreakPointsStat = GameStatistic(title: "Fastbreak Points", value: (boxscore.homeTeam.teamGameStats.fastBreakPoints, boxscore.visitorTeam.teamGameStats.fastBreakPoints))
            
            let pointsInPaintStat = GameStatistic(title: "Points in the Paint", value: (boxscore.homeTeam.teamGameStats.pointsInPaint, boxscore.visitorTeam.teamGameStats.pointsInPaint))
            
            let secondChancePointsStat = GameStatistic(title: "Second Chance Points", value: (boxscore.homeTeam.teamGameStats.secondChancePoints, boxscore.visitorTeam.teamGameStats.secondChancePoints))
            
            let pointsOffTurnoversStat = GameStatistic(title: "Points Off Turnovers", value: (boxscore.homeTeam.teamGameStats.pointsOffTurnovers, boxscore.visitorTeam.teamGameStats.pointsOffTurnovers))
            
            let turnoversStat = GameStatistic(title: "Turnovers", value: (boxscore.homeTeam.teamGameStats.turnovers, boxscore.visitorTeam.teamGameStats.turnovers))
            
            let personalFoulsStat = GameStatistic(title: "Personal Fouls", value: (boxscore.homeTeam.teamGameStats.pFouls, boxscore.visitorTeam.teamGameStats.pFouls))
            
            let teamFoulsStat = GameStatistic(title: "Team Fouls", value: (boxscore.homeTeam.teamGameStats.teamFouls, boxscore.visitorTeam.teamGameStats.teamFouls))
            
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
            let fieldGoalsHome = (made: boxscore.homeTeam.teamGameStats.fgm, attempted: boxscore.homeTeam.teamGameStats.fga, percentage: boxscore.homeTeam.teamGameStats.fgp)
            let fieldGoalsVisitor = (made: boxscore.visitorTeam.teamGameStats.fgm, attempted: boxscore.visitorTeam.teamGameStats.fga, percentage: boxscore.visitorTeam.teamGameStats.fgp)
            let fieldGoalsStat = GameStatistic(title: "Field Goals", value: (home: fieldGoalsHome, visitor: fieldGoalsVisitor))
            
            let threePointsHome = (made: boxscore.homeTeam.teamGameStats.tpm, attempted: boxscore.homeTeam.teamGameStats.tpa, percentage: boxscore.homeTeam.teamGameStats.tpp)
            let threePointsVisitor = (made: boxscore.visitorTeam.teamGameStats.tpm, attempted: boxscore.visitorTeam.teamGameStats.tpa, percentage: boxscore.visitorTeam.teamGameStats.tpp)
            let threePointsStat = GameStatistic(title: "Three Points", value: (home: threePointsHome, visitor: threePointsVisitor))
            
            let freeThrowsHome = (made: boxscore.homeTeam.teamGameStats.ftm, attempted: boxscore.homeTeam.teamGameStats.fta, percentage: boxscore.homeTeam.teamGameStats.ftp)
            let freeThrowsVisitor = (made: boxscore.visitorTeam.teamGameStats.ftm, attempted: boxscore.visitorTeam.teamGameStats.fta, percentage: boxscore.visitorTeam.teamGameStats.ftp)
            let freeThrowsStat = GameStatistic(title: "Free Throws", value: (home: freeThrowsHome, visitor: freeThrowsVisitor))
            
            teamShootingStats.append(contentsOf: [
                fieldGoalsStat,
                threePointsStat,
                freeThrowsStat,
            ])
            
            // MARK: - Team Leaders Stats
            
            let pointsLeaders = GameStatistic(title: "Points", value: (home: boxscore.homeTeam.teamLeaders.points, visitor: boxscore.visitorTeam.teamLeaders.points))
            
            let assistsLeaders = GameStatistic(title: "Assists", value: (home: boxscore.homeTeam.teamLeaders.assists, visitor: boxscore.visitorTeam.teamLeaders.assists))
            
            let reboundsLeaders = GameStatistic(title: "Rebounds", value: (home: boxscore.homeTeam.teamLeaders.rebounds, visitor: boxscore.visitorTeam.teamLeaders.rebounds))
            
            teamLeadersStats.append(contentsOf: [
                pointsLeaders,
                assistsLeaders,
                reboundsLeaders,
            ])
        }
        return (generalStats: teamGeneralStats, shootingStats: teamShootingStats, leadersStats: teamLeadersStats)
    }
    
    func reloadData() {
        self.isLoading = true
        self.boxscoreDataService.getBoxscore()
        HapticManager.notification(type: .success)
    }
}
