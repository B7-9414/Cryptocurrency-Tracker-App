//
//  LocalFileManager.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/29/24.
//

import Foundation
import SwiftUI

class LocalFileManager {
    static let shared = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage, withName imageName: String, in folderName: String) {
        createFolderIfNeeded(withName: folderName)
        
        // Get path for image
        guard let data = image.pngData(),
              let url = getURLForImage(imageName: imageName, folderName: folderName) else {
            return
        }
        
        // Save image to the specified path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image \(imageName): \(error.localizedDescription)")
        }
    }
    
    func getImage(withName imageName: String, from folderName: String) -> UIImage? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {
//            print("Can't find image. Image name: \(imageName) Folder name: \(folderName)")
            return nil
        }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    func createFolderIfNeeded(withName name: String) {
        guard let url = getURLForFolder(folderName: name) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory \(name): \(error.localizedDescription)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return url.appendingPathComponent(folderName)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let url = getURLForFolder(folderName: folderName) else { return nil }
        
        return url.appendingPathComponent(imageName + ".png")
    }
}
