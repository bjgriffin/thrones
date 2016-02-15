//
//  CharacterDetailViewController.swift
//  thrones
//
//  Created by BJ Griffin on 2/14/16.
//  Copyright © 2016 BJ Griffin. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    var character : Character?
    
    override func viewDidLoad() {
        setCharacterInfo()
    }
    
    private func setCharacterInfo() {
        let imageName = character?.image ?? ""
        characterImageView.setImageView(imageName, round: true)
        
        nameLabel.text = character?.name
        detailsTextView.text = character?.detail
    }
}
