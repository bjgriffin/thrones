//
//  DataManager.swift
//  thrones
//
//  Created by BJ Griffin on 2/21/16.
//  Copyright © 2016 BJ Griffin. All rights reserved.
//

import Foundation

class DataManager {
    
    class var sharedInstance : DataManager {
        struct Static {
            static let instance = DataManager()
        }
        return Static.instance
    }
    
    func loadCharacters(completion:([Character]?)->()) {
        guard let path = NSBundle.mainBundle().pathForResource("Data", ofType: "plist") else { return }
        
        let content = NSDictionary(contentsOfFile: path)
        var characters: [Character]?
        
        if let plistCharacters = content?.objectForKey("Characters") as? [NSDictionary] {
            characters = []
            for plistCharacter in plistCharacters {
                let character = Character()
                character.name = plistCharacter.objectForKey("name") as? String
                character.image = plistCharacter.objectForKey("image") as? String
                character.detail = plistCharacter.objectForKey("detail") as? String
                
                characters?.append(character)
            }
            completion(characters)
            return
        }
        
        completion(nil)
    }

}
