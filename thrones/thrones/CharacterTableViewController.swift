//
//  ViewController.swift
//  thrones
//
//  Created by BJ Griffin on 2/9/16.
//  Copyright © 2016 BJ Griffin. All rights reserved.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    var characters: [Character]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characters = (UIApplication.sharedApplication().delegate as? AppDelegate)?.characters
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedCharacter = sender as? Character
        
        if let controller = segue.destinationViewController as? CharacterDetailViewController {
            controller.character = selectedCharacter
        }
    }
    
    //MARK: UITableViewDataSource Methods
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(characterCell, forIndexPath: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        
        let imageName = characters?[indexPath.row].image ?? ""
        cell.characterImageView.setImageView(imageName, round: true)
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    //MARK: UITableViewDelegate Methods
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCharacter = characters?[indexPath.row]

        performSegueWithIdentifier(detailSegue, sender: selectedCharacter)
    }

}

