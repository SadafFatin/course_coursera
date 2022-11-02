//
//  LeagueVC.swift
//  app-swoosh
//
//  Created by Sadaf Fatin on 11/7/20.
//  Copyright © 2020 BISMILLAH-IT. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {
    
    //models
    var player:Player!
    
    
    //view
    @IBOutlet weak var nextButton: BorderButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
    }
    
    
    
    func selectLeague(league: String) {
       player.desiredLeague = league
       nextButton.isEnabled = true
    }
    
    @IBAction func onNextTapped(_ sender: Any) {
        performSegue(withIdentifier: "SkillVCSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let skillVC = segue.destination as? SkillVC{
            skillVC.player = player
        }
    }
    
    
    @IBAction func onMensTapped(_ sender: Any) {
        selectLeague(league: "Men")
    }
    
    @IBAction func onWomensTapped(_ sender: Any) {
         selectLeague(league: "Women")

    }
    
    @IBAction func oncoEdTapped(_ sender: Any) {
         selectLeague(league: "Co-ed")
    }
    
    
    
}
