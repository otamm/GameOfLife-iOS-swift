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
        
    var totalAlive = 0 // these two store the label values for the game stats in the current state.
    var generation = 0
        
    private var cellWidth: CGFloat = 0 // private vars are not accessible to/from other classes.
    private var cellHeight: CGFloat = 0 // define height & width of a grid cell
    private var gridArray: [[Creatures]]! // actual storage of creatures in the grid
        
    // Add Grid methods below here
    
    override func onEnter() { // this method is automatic in Swift. This code overrides the method.
        super.onEnter() // handles touch events
        
        setupGrid()
        
        userInteractionEnabled = true
    }
    
    private func setupGrid() {
        
        cellWidth = contentSize.width / CGFloat(GridColumns) // calculates the size of the grid by dividing
        cellHeight = contentSize.height / CGFloat(GridRows) //grid's size by the amount of rows & cols
        
        gridArray = []
        
        for row in 0..<GridRows {
            
            gridArray.append([]) // creates a new array for each row
            
            for column in 0..<GridColumns { // fills the array with a number of 'creature' objects equal to the number of columns in that row;
                
                var creature = Creatures() // creates a new instance of the Creature() class;
                creature.position = CGPoint(x: cellWidth * CGFloat(column), // sets the 'position'
                    y: cellHeight * CGFloat(row)) //attribute of current Creature class instance equal to
                addChild(creature) // its position in the grid
                
                gridArray[row].append(creature) // pushes the creature instance to the current row array
                
                // make creatures visible to test this method,
                // set to false once we know we have filled the grid properly
                creature.isAlive = true;
            }
        }
    }
    
  }

    

