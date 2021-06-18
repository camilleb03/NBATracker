//
//  ScoreboardDataService.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-15.
//

import Foundation
import Combine

class ScoreboardDataService {
    
    @Published var allScoreboards: [Scoreboard] = []
    var scoreboardSubscription: AnyCancellable?
    
    init() {
        getScoreboards()
    }
    
    func getScoreboards(for date: Date = Date()) {
        let url = Endpoint.scoreboard(for: date.convertDateToyyyyMMddString()).NBAv2URL
        
        scoreboardSubscription =
            NetworkingManager.download(url: url)
            .decode(type: ScoreboardRawResponse.self, decoder: JSONDecoder())
            .mapError(NetworkingManager.handleMapError)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedScoreboardRawResponse) in
                self?.allScoreboards = returnedScoreboardRawResponse.scoreboards
                self?.scoreboardSubscription?.cancel()
            })
    }
}
