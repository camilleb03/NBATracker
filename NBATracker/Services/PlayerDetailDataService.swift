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
    
    var playerDetailSubscription: AnyCancellable?
    let player: Player
    
    init(player: Player) {
        self.player = player
        getPlayerDetails()
    }
    
    func getPlayerDetails() {
        
        let url = Endpoint.playerProfile(for: "2020", by: player.id).NBAv1URL
        
        playerDetailSubscription =
            NetworkingManager.download(url: url)
            .decode(type: PlayerDetail.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedPlayerDetails) in
                self?.playerDetails = returnedPlayerDetails
                self?.playerDetailSubscription?.cancel()
            })
    }
}
