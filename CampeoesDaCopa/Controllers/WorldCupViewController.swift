//
//  WorldCupViewController.swift
//  CampeoesDaCopa
//
//  Created by User on 30/10/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var worldCup: WorldCup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WorldCup \(worldCup.year)"
        prepare()
        prepareTableView()
    }

    func prepare() {
        ivWinner.image = UIImage(named: "\(worldCup.winner)")
        ivVice.image = UIImage(named: "\(worldCup.vice)")
        lbWinner.text = "\(worldCup.winner)"
        lbVice.text = "\(worldCup.vice)"
        score.text = "\(worldCup.winnerScore) X \(worldCup.viceScore)"
    }
    
    func prepareTableView() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
}

extension WorldCupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup.matches[section]
        return match.stage
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        let match = worldCup.matches[indexPath.section]
        let game = match.games[indexPath.row]
        cell.prepare(with: game)
        
        return cell
    }
    
}
