//
//  Grid.swift
//  GameOfLife
//
//  Created by Otavio Monteagudo on 3/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Grid: CCSprite {
   
    let GridRows = 8 // constant
    let GridColumns = 10 // constant
    
    class Grid: CCSprite {
        
        var totalAlive = 0
        var generation = 0
        
        private var cellWidth: CGFloat = 0 // private vars are not accessible to/from other classes.
        private var cellHeight: CGFloat = 0
        private var gridArray: [[Creature]]!
        
        // Add Grid methods below here
    }
    
}
