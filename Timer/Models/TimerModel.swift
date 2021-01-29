//
//  TimerModel.swift
//  Timer
//
//  Created by Christopher Hicks on 1/28/21.
//

import SwiftUI

class TimerModel: ObservableObject {
    
    @Published var timerActive : Bool = true
    @Published var startTimer : Float = 0
    @Published var timeRemaining : Float = 0
    
    var timer: Timer?  //Optional Timer
    
    func runTimer(time: Float) {
        
        invalidateTimer()
        initTimer(time: time)
        
        print("Time start is \(startTimer)")
        checkTimeremaining()
    }
    
    func resetTimer() {
        
        invalidateTimer()
    }
}

//MARK: - Timer Functions 

extension TimerModel {
    
    func initTimer(time: Float) {
        
        startTimer = time
        timeRemaining = startTimer
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { time in self.timerFunction(time: time)}
    }
    
    func invalidateTimer() {
        startTimer = 0
        timeRemaining = 0
        
        timer?.invalidate()
    }
    
    func timerFunction(time: Timer) {
        reduceTime()
        checkTimeremaining()
        
    }
    
    func reduceTime() {
        
        if timeRemaining == 0 {
            invalidateTimer()
            timerActive = false
        } else {
            timeRemaining -= 1
            timerActive = true
        }
        
    }
    
    func checkTimeremaining() {
        print("The Time remaing is \(timeRemaining)")
    }
    
}
