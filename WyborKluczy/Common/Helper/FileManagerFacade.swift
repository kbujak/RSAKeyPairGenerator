//
//  FileManagerFacade.swift
//  WyborKluczy
//
//  Created by Krystian Bujak on 30/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import Foundation

class FileManagerFacade {
    func saveFile(at name: String, content: String) {
        let fileManager = FileManager.default
        
        do {
            let documentDirectory = try fileManager.url(for: .cachesDirectory,
                                                        in: .userDomainMask,
                                                        appropriateFor: nil,
                                                        create: false)
            let fileURL = documentDirectory.appendingPathComponent(name).appendingPathExtension("key")
            print(fileURL.absoluteString)

            try content.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
