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
    @Published var filterOption: Conference = .east
    
    private let confStandingsDataService: ConfStandingsDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(confStandingsDataService: ConfStandingsDataService = ConfStandingsDataService()) {
        self.confStandingsDataService = confStandingsDataService
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates allConfStandings
        confStandingsDataService.$confStandings
            .combineLatest($filterOption)
            .map(filterAndSortTeams)
            .sink { [weak self] (returnedConfStandings) in
                self?.allConfStandings = returnedConfStandings
            }
            .store(in: &cancellables)
    }
    
    private func filterAndSortTeams(teams: [TeamStandingInfo], filterOption: Conference) -> [TeamStandingInfo] {
        let updatedStandings = teams.filter { $0.conference == filterOption }
        return updatedStandings
    }
    
    func reloadData() {
        confStandingsDataService.getConfStandings()
    }
}
