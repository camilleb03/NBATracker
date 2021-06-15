//
//  PlayerDataService.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import Foundation
import Combine

class PlayerDataService {
    
    @Published var allPlayers: [Player] = []
    var playerSubscription: AnyCancellable?
    
    init() {
        getPlayers()
    }
    
    func getPlayers() {
        let url = Endpoint.players(for: "2020").NBAv2URL
        playerSubscription =
            NetworkingManager.download(url: url)
            .decode(type: PlayerRawResponse.self, decoder: JSONDecoder())
            .mapError(NetworkingManager.handleMapError)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedPlayerRawResponse) in
                self?.allPlayers = returnedPlayerRawResponse.players
                self?.playerSubscription?.cancel()
            })
    }
}
