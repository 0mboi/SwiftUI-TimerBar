//
//  TimeLabel.swift
//  Timer
//
//  Created by Christopher Hicks on 1/28/21.
//

import SwiftUI

struct TimeLabel: View {
    
    @EnvironmentObject var model : TimerModel
    
    let completedIcon : String = "checkmark.circle.fill"
    var remainingTime : String { String(model.timeRemaining)}
    
    var body: some View {
        
        ZStack {
            
            if model.timerActive == false {
                
                Image(systemName: completedIcon)
                    .font(.largeTitle)
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(Color(.systemTeal))
                    .onTapGesture {
                        model.initTimer(time: 50)
                    }
                    .onLongPressGesture(perform: model.resetTimer)
                
            } else {
                
                Text(remainingTime)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(Color(.systemGray))
                    .onTapGesture {
                        model.initTimer(time: 50)
                    }
                    .onLongPressGesture(perform: model.resetTimer)
                
            }
            
        }
    }
}


