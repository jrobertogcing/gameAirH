//
//  MenuViewController.swift
//  airH
//
//  Created by Robert on 27/12/17.
//  Copyright © 2017 Robert González. All rights reserved.
//

import UIKit

enum gameType{

    case easy
    case medium
    case hard
    case playerTwo

}


class MenuViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// Functions
    
    @IBAction func playerTwoButtonAction(_ sender: UIButton) {
        
        moveToGame(game: .playerTwo)
        
    }
    
    @IBAction func easyButtonAction(_ sender: UIButton) {
        
        moveToGame(game: .easy)
    }
    
    @IBAction func mediumButtonAction(_ sender: UIButton) {
        
        moveToGame(game: .medium)
    }
    
    
    @IBAction func hardButtonAction(_ sender: UIButton) {
        
        moveToGame(game: .hard)
    }
    
    func moveToGame(game: gameType) {
        
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameViewController") as! GameViewController
        
        currentGameType = game
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
        
    }
    

}
