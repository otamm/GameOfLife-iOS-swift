import Foundation;

class MainScene: CCNode {
    
    var grid: Grid!
    var generationLabel: CCLabelTTF!
    var populationLabel: CCLabelTTF!
    var timer = CCTimer() // evolution timer
    
    func play() {
        schedule("step", interval: CCTime(0.5)) // starts the timer
    }
    
    func pause() {
        unschedule("step") //stops the timer
    }
    
    func step() {
        grid.evolveStep()
        
        generationLabel.string = "\(grid.generation)"
        populationLabel.string = "\(grid.totalAlive)"
    }
    
}
