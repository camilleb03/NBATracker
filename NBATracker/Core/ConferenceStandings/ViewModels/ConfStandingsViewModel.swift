//
//  ConfStandingsViewModel.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-07-20.
//

import Foundation
import Combine

class ConfStandingsViewModel: ObservableObject {
    
    @Published var allConfStandings: [TeamStandingInfo] = []
    
    private let confStandingsDataService: ConfStandingsDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(confStandingsDataService: ConfStandingsDataService = ConfStandingsDataService()) {
        self.confStandingsDataService = confStandingsDataService
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates allConfStandings
        confStandingsDataService.$confStandings
            .sink { [weak self] (returnedConfStandings) in
                self?.allConfStandings = returnedConfStandings
            }
            .store(in: &cancellables)
    }
    
    func reloadData() {
        confStandingsDataService.getConfStandings()
    }
}
