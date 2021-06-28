//
//  TeamImageService.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import Foundation
import SwiftUI
import Combine

class TeamImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let teamTricode: String
    private let logoType: LogoType
    private let fileManager = LocalFileManager.instance
    private let folderName = "team_images"
    private let imageName: String
    
    init(teamTricode: String, logoType: LogoType) {
        self.teamTricode = teamTricode
        self.logoType = logoType
        self.imageName = "\(teamTricode)_\(logoType.rawValue)"
        getTeamImage()
    }
    
    private func getTeamImage() {
        if let savedImage = fileManager.getImage(imageName: self.imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image \(self.imageName) from File Manager")
        } else {
            downloadTeamImage()
            print("Downloading image \(self.imageName) now")
        }
    }
    
    private func downloadTeamImage() {
        let url = Endpoint.logo(for: self.teamTricode, as: self.logoType).logoURL
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
