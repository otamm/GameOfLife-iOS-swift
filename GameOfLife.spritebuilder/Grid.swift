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
    
    // CCNode class' touchBegan method available with Cocos2D 3.0 framework;
    // this method is supposed to be triggered in a touch event, the framework accesses the touch when
    // userInteractionEnabled is true (see method above); below is an override for the method:
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        
        var touchLocation = touch.locationInNode(self) // specifies position touched in grid
        
        var creature = creatureForTouchPosition(touchLocation) // defined just below
        
        creature.isAlive = !creature.isAlive // creates a creature on that space if it's not already taken.
        
        // if a value is set for a given created property (like isAlive), an action called didSet is created and triggered.
        // ordinarily, this method will only set a value for the attribute, but since it is overriden in the Creatures class, a creature will also die if a live one is touched (which is not explicit just here).
    }
    
    // this method takes an object of CGPoint class  as parameter(touchPosition) and returns a Creatures object. Arrow (->) indicates 'class of return'.
    
    private func creatureForTouchPosition(touchPosition: CGPoint) -> Creatures {
        
        var row = Int(touchPosition.y / cellHeight) // touched creature's location in the row.
        var column = Int(touchPosition.x / cellWidth) // same as above for column.
        
        return gridArray[row][column]
    }
    
    private func countNeighbors() {
        
        for row in 0..<gridArray.count {
            for column in 0..<gridArray[row].count {
                
                var currentCreature = gridArray[row][column]
                currentCreature.livingNeighborsCount = 0
                
                for x in (row - 1)...(row + 1) {
                    for y in (column - 1)...(column + 1) {
                        
                        var validIndex = isValidIndex(x: x, y: y)
                        
                        if validIndex && !(x == row && y == column) {
                            
                            var neighbor = gridArray[x][y]
                            
                            if neighbor.isAlive {
                                currentCreature.livingNeighborsCount++
                            }
                        }
                    }
                }
            }
        }
    }
    
    // checks if a given index is inside of the Grid. Returns a boolean.
    private func isValidIndex(#x: Int, y: Int) -> Bool {
        return !(x < 0 || y < 0 || x >= GridRows || y >= GridColumns)
    }
    
    private func updateCreatures() {
        // nested loop accesses every square, and therefore every creature in the grid
        
        var totalAlive = 0 // resets
        
        for row in 0..<gridArray.count {
            
            for column in 0..<gridArray[row].count {
                
                var currentCreature = gridArray[row][column]
                
                // creature becomes alive if it has 3 neighbors, keep alive if it has 2 and dies if it has more than 3 or less than 2 neighbors.
                if (currentCreature.livingNeighbors == 3) {
                    currentCreature.isAlive = true
                    totalAlive++
                } else if (currentCreature.livingNeighbors != 2) {
                    currentCreature.isAlive = false
                } else { // currentCreatures.livingNeighbors == 2
                    totalAlive++
                }
                
            }
            
        }
        
    }
    
    private func evolveStep() {
        
        //update each Creature's neighbor count
        countNeighbors()
        
        //update each Creature's state
        updateCreatures()
        
        //update the generation so the label's text will display the correct generation
        generation++
        
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
                creature.isAlive = false; // working.
            }
        }
    }
    
  }

    

