//
//  TeamDataService.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-15.
//

import Foundation
import Combine

class TeamDataService {
    
    @Published var allTeams: [Team] = []
    var teamSubscription: AnyCancellable?
    
    init() {
        getTeams()
    }
    
    func getTeams() {
        let url = Endpoint.teams(for: "2020").NBAv2URL
        teamSubscription =
            NetworkingManager.download(url: url)
            .decode(type: TeamRawResponse.self, decoder: JSONDecoder())
            .mapError(NetworkingManager.handleMapError)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedTeamRawResponse) in
                self?.allTeams = returnedTeamRawResponse.teams
                self?.teamSubscription?.cancel()
            })
    }
}
