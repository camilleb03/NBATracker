//
//  PlayerProfileViewModel.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-07-06.
//

import Foundation
import Combine

class PlayerProfileViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var player: Player
    @Published var allPlayerBio: [GameStatistic<String>] = []
    @Published var allCareerStats: [GameStatistic<Double>] = []
    
    private let playerDetailsDataService: PlayerDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(player: Player, playerDetailsDataService: PlayerDetailDataService) {
        self.player = player
        self.playerDetailsDataService = playerDetailsDataService
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        $player
            .map(mapPlayerToBio)
            .assign(to: &$allPlayerBio)
        
        playerDetailsDataService.$playerDetails
            .map(mapPlayerDetailsToStatistics)
            .sink(receiveValue: { [weak self] (returnedPlayerDetails) in
                guard let self = self else { return }
                self.allCareerStats = returnedPlayerDetails
                self.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    private func mapPlayerDetailsToStatistics(playerDetails: PlayerDetail?) -> [GameStatistic<Double>] {
        
        var careerAverageStats: [GameStatistic<Double>] = []
        
        if let playerDetails = playerDetails {
            let careerSummary = playerDetails.careerSummary
            let gamesPlayed = GameStatistic<Double>(title: "g", value: Double(careerSummary.gamesPlayed))
            let gamesStarted = GameStatistic<Double>(title: "gs", value: Double(careerSummary.gamesStarted))
            let mpg = GameStatistic<Double>(title: "mpg", value: careerSummary.mpg)
            let ppg = GameStatistic<Double>(title: "ppg", value: careerSummary.ppg)
            let apg = GameStatistic<Double>(title: "apg", value: careerSummary.apg)
            let rpg = GameStatistic<Double>(title: "rpg", value: careerSummary.rpg)
            let spg = GameStatistic<Double>(title: "spg", value: careerSummary.spg)
            let bpg = GameStatistic<Double>(title: "bpg", value: careerSummary.bpg)
            
            careerAverageStats.append(contentsOf: [
                gamesPlayed, gamesStarted, mpg, ppg, apg, rpg, spg, bpg,
            ])
            
            if let topg = careerSummary.topg {
                careerAverageStats.append(GameStatistic<Double>(title: "topg", value: topg))
            }
            
            let fgp = GameStatistic<Double>(title: "fg%", value: careerSummary.fgp)
            let tpp = GameStatistic<Double>(title: "tp%", value: careerSummary.tpp)
            let ftp = GameStatistic<Double>(title: "ft%", value: careerSummary.ftp)
            
            let plusMinus = GameStatistic<Double>(title: "+/-", value: careerSummary.plusMinus)
            
            let totalDD2 = GameStatistic<Double>(title: "dd2", value: Double(careerSummary.totalDD2))
            
            let totalTD3 = GameStatistic<Double>(title: "td3", value: Double(careerSummary.totalTD3))
            
            careerAverageStats.append(contentsOf: [
                fgp, tpp, ftp, plusMinus, totalDD2, totalTD3,
            ])
        }
        
        return careerAverageStats
    }
    
    private func mapPlayerToBio(player: Player) -> [GameStatistic<String>]{
        
        var playerBio: [GameStatistic<String>] = []
        if let dateOfBirthString = player.dateOfBirthUTC {
            playerBio.append(GameStatistic<String>(title: "born", value: dateOfBirthString))
        }
        
        return playerBio
    }
    
    func reloadData() {
        self.isLoading = true
        self.playerDetailsDataService.getPlayerDetails()
        HapticManager.notification(type: .success)
    }
}
