//
//  PlayerDetailDataService.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import Foundation
import Combine

class PlayerDetailDataService {
    
    @Published var playerDetails: PlayerDetail? = nil
    
    private var playerDetailSubscription: AnyCancellable?
    let playerID: String
    
    init(playerID: String) {
        self.playerID = playerID
        getPlayerDetails()
    }
    
    func getPlayerDetails() {
        
        let url = Endpoint.playerProfile(for: "2020", by: playerID).NBAv1URL
        
        playerDetailSubscription =
            NetworkingManager.download(url: url)
            .decode(type: PlayerDetailRawResponse.self, decoder: JSONDecoder())
            .mapError(NetworkingManager.handleMapError)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedPlayerDetailsRawResponse) in
                self?.playerDetails = returnedPlayerDetailsRawResponse.playerDetail
                self?.playerDetailSubscription?.cancel()
            })
    }
}
