//
//  MainViewController.swift
//  PartyRockApp
//
//  Created by Agarwal,Anisha on 10/16/16.
//  Copyright © 2016 Agarwal,Anisha. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://img.youtube.com/vi/vO35DVm_5ts/0.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3IF9o2crV84\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Tera Mujhse Hai Pehle")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/lNB9FPEUM24/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/lNB9FPEUM24\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Likhe jo khat tujhe")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/jem6GLW9njk/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/BOLYNw3x1lE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Choo kar mere man ko")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/C__MBirb2rY/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qE7C35WxKno\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Jab koi baat bigad jaaye")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/g0eO74UmRBs/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/g0eO74UmRBs\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Kal ho na ho")
        
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
        }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoViewController", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoViewController {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}

