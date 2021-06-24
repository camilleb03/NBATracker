//
//  BoxscoreDataService.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-18.
//

import Foundation
import Combine

class BoxscoreDataService {
    
    let gameId: String
    let gameDate: Date
    
    @Published var boxscore: Boxscore? = nil
    private var boxscoreSubscription: AnyCancellable?
    
    init(gameDate: Date, gameId: String) {
        self.gameDate = gameDate
        self.gameId = gameId
        getBoxscore()
    }
    
    func getBoxscore() {
        let url = Endpoint.boxscore(on: gameDate.convertDateToyyyyMMddString(), for: gameId).NBAv1URL
        
        boxscoreSubscription =
            NetworkingManager.download(url: url)
            .decode(type: BoxscoreRawResponse.self, decoder: JSONDecoder())
            .mapError(NetworkingManager.handleMapError)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedBoxscoreRawResponse) in
                self?.boxscore = returnedBoxscoreRawResponse.boxscore
                self?.boxscoreSubscription?.cancel()
            })
    }
}
