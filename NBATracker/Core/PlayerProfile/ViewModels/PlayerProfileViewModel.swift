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
    @Published var allCareerStats: [GameStatistic<String>] = []
    
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
    
    private func mapPlayerDetailsToStatistics(playerDetails: PlayerDetail?) -> [GameStatistic<String>] {
        
        var careerAverageStats: [GameStatistic<String>] = []
        
        if let playerDetails = playerDetails {
            let careerSummary = playerDetails.careerSummary
            let gamesPlayed = GameStatistic<String>(title: "g", value: "\(careerSummary.gamesPlayed)")
            let gamesStarted = GameStatistic<String>(title: "gs", value: "\(careerSummary.gamesStarted)")
            let mpg = GameStatistic<String>(title: "mpg", value: careerSummary.mpg.convertStatToString())
            let ppg = GameStatistic<String>(title: "ppg", value: careerSummary.ppg.convertStatToString())
            let apg = GameStatistic<String>(title: "apg", value: careerSummary.apg.convertStatToString())
            let rpg = GameStatistic<String>(title: "rpg", value: careerSummary.rpg.convertStatToString())
            let spg = GameStatistic<String>(title: "spg", value: careerSummary.spg.convertStatToString())
            let bpg = GameStatistic<String>(title: "bpg", value: careerSummary.bpg.convertStatToString())
            
            careerAverageStats.append(contentsOf: [
                gamesPlayed, gamesStarted, mpg, ppg, apg, rpg, spg, bpg,
            ])
            
            if let topg = careerSummary.topg {
                careerAverageStats.append(GameStatistic<String>(title: "topg", value: topg.convertStatToString()))
            }
            
            let fgp = GameStatistic<String>(title: "fg%", value: careerSummary.fgp.convertDoubleToPercentString())
            let tpp = GameStatistic<String>(title: "tp%", value: careerSummary.tpp.convertDoubleToPercentString())
            let ftp = GameStatistic<String>(title: "ft%", value: careerSummary.ftp.convertDoubleToPercentString())
            
            let plusMinus = GameStatistic<String>(title: "+/-", value: careerSummary.plusMinus.convertStatToString())
            
            let totalDD2 = GameStatistic<String>(title: "dd2", value: "\(careerSummary.totalDD2)")
            
            let totalTD3 = GameStatistic<String>(title: "td3", value: "\(careerSummary.totalTD3)")
            
            careerAverageStats.append(contentsOf: [
                fgp, tpp, ftp, plusMinus, totalDD2, totalTD3,
            ])
        }
        
        return careerAverageStats
    }
    
    private func mapPlayerToBio(player: Player) -> [GameStatistic<String>] {
        
        var playerBio: [GameStatistic<String>] = []
        
        if let dateOfBirthString = player.dateOfBirthUTC, let age = Calendar.current.dateComponents([.year], from: Date(birthDateString: dateOfBirthString), to: Date()).year {
            playerBio.append(GameStatistic<String>(title: "born", value: "\(dateOfBirthString) (Age \(age))"))
        }
        
        if let college = player.collegeName {
            playerBio.append(GameStatistic<String>(title: "college", value: college))
        }
        
        if let country = player.country {
            playerBio.append(GameStatistic<String>(title: "country", value: country))
        }
        
        if let height = player.heightMeters {
            playerBio.append(GameStatistic<String>(title: "height", value: height.convertMetricToString() + "m"))
        }
        
        if let weight = player.weightKilograms {
            playerBio.append(GameStatistic<String>(title: "weight", value: weight.convertMetricToString() + "kg"))
        }
        
        if let debutYear = player.nbaDebutYear {
            playerBio.append(GameStatistic<String>(title: "debut", value: debutYear))
        }
        
        if let draft = player.draft {
            playerBio.append(GameStatistic<String>(title: "draft", value: "\(draft.seasonYear) R\(draft.roundNum) Pick \(draft.pickNum)"))
        }
        
        return playerBio
    }
    
    func reloadData() {
        self.isLoading = true
        self.playerDetailsDataService.getPlayerDetails()
        HapticManager.notification(type: .success)
    }
}
