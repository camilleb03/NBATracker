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
    
    private static let iso8601FullFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    func getScoreboards() {
        let url = Endpoint.scoreboard(for: Date().convertDateToyyyyMMddString()).NBAv2URL
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(ScoreboardDataService.iso8601FullFormatter)
        
        scoreboardSubscription =
            NetworkingManager.download(url: url)
            .decode(type: ScoreboardRawResponse.self, decoder: decoder)
            .mapError(NetworkingManager.handleMapError)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedScoreboardRawResponse) in
                self?.allScoreboards = returnedScoreboardRawResponse.scoreboards
                self?.scoreboardSubscription?.cancel()
            })
    }
}
