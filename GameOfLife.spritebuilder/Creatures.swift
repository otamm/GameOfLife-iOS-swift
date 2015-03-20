//
//  Creatures.swift
//  GameOfLife
//
//  Created by Otavio Monteagudo on 3/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Creatures: CCSprite {
    var isAlive:Bool = false {
        
        // by default, creature is not alive at first.
        didSet {
            self.visible = isAlive
        }
        
    } // connects isAlive state with visibility state; if creature is visible, then isAlive = true;
    
    var livingNeighborsCount = 0 // total of living neighbours.
    
    convenience override init() { // will call a second initializer instead of the default Swift initializer; 'convenience' keyword specifies that.
        
        self.init(imageNamed: "GameOfLifeAssets/Assets/bubble.png") // image asset for living creature
        anchorPoint = CGPoint(x: 0, y: 0) // initial point
        
    }
}
