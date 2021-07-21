//
//  ConfStandingsDataService.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-07-20.
//

import Foundation
import Combine

class ConfStandingsDataService {
    
    @Published var confStandings: [TeamStandingInfo] = []
    var confStandingSubscription: AnyCancellable?
    
    init() {
        getConfStandings()
    }
    
    func getConfStandings() {
        let url = Endpoint.confStandings.NBAv2URL
        confStandingSubscription =
            NetworkingManager.download(url: url)
            .decode(type: StandingsRawResponse.self, decoder: JSONDecoder())
            .mapError(NetworkingManager.handleMapError)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedConfStandingsRawResponse) in
                self?.confStandings = returnedConfStandingsRawResponse.conferenceStandings
                self?.confStandingSubscription?.cancel()
            })
    }
}
