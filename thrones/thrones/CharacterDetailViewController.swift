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
    var updateInfo : (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo = {
            self.setCharacterInfo()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateInfo?()
    }
    
    private func setCharacterInfo() {
        let imageName = character?.image ?? ""
        characterImageView?.image = UIImage(named: imageName)
        characterImageView?.roundImage()
        
        nameLabel?.text = character?.name
        detailsTextView?.text = character?.detail
    }
    
}
