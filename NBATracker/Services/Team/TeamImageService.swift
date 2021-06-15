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
    private let fileManager = LocalFileManager.instance
    private let folderName = "team_images"
    private let imageName: String
    
    init(teamTricode: String) {
        self.teamTricode = teamTricode
        self.imageName = teamTricode
        getTeamImage()
    }
    
    private func getTeamImage() {
        if let savedImage = fileManager.getImage(imageName: self.imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager")
        } else {
            downloadTeamImage()
            print("Downloading image now")
        }
    }
    
    private func downloadTeamImage() {
        let url = Endpoint.logo(for: teamTricode).logoURL
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
