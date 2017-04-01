//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Jernej Hartman on 22/03/2017.
//  Copyright © 2017 Jernej Hartman. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe src=\"https://www.youtube.com/embed/ev4bY1SkZLg?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe>", videoTitle: "Where the Sun Goes down")
        
        let p2 = PartyRock(imageURL: "http://s4.hulkshare.com/song_images/original/d/c/4/dc4881c9c3f07948349134b7b401b3f4.jpg?dd=1436203021", videoURL: "<iframe src=\"https://www.youtube.com/embed/JG94OgopDB0?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe>", videoTitle: "Higher Place")
        
        
         let p3 = PartyRock(imageURL: "https://yt3.ggpht.com/-huXxNKUt9hE/AAAAAAAAAAI/AAAAAAAAAAA/5JUWEc3jXjw/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe src=\"https://www.youtube.com/embed/exJlapzPnlc?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe>", videoTitle: "The Hum")
        
         let p4 = PartyRock(imageURL: "https://yt3.ggpht.com/-huXxNKUt9hE/AAAAAAAAAAI/AAAAAAAAAAA/5JUWEc3jXjw/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe src=\"https://www.youtube.com/embed/XlqaaJdLUcM?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe>", videoTitle: "Born To Get Wild")
        
         let p5 = PartyRock(imageURL: "https://yt3.ggpht.com/-huXxNKUt9hE/AAAAAAAAAAI/AAAAAAAAAAA/5JUWEc3jXjw/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe src=\"https://www.youtube.com/embed/UEvcQkYE_r0?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe>", videoTitle: "G.I.P.S.Y.")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else  {
            
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
    performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                
                destination.partyRock = party
            }
        }
    }
}

