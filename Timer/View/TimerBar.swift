//
//  TimerBar.swift
//  Timer
//
//  Created by Christopher Hicks on 1/28/21.
//

import SwiftUI

struct TimerBar: View {
    
    @EnvironmentObject var model: TimerModel
    
    let width : CGFloat = 5
    let height : CGFloat = 350
    let cornerRadius : CGFloat = 5
    
    var progressBarColor : Color {
        
        if model.startTimer == 10 {
            return Color(.systemYellow)
        } else if model.startTimer == 25 {
            return Color(.systemRed)
        } else if model.startTimer == 50 {
            return Color(.systemBlue)
        } else {
            return Color(.systemPink)
        }
        
    }
    
    var progressBar : CGFloat {
        
        if model.timerActive == true {
            return CGFloat(model.timeRemaining / model.startTimer * 350)
        } else {
            return 0
            
        }
       
    }
   
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(Color(.systemGray5))
                .frame(width: width, height: height, alignment: .center)

            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(progressBarColor)
                    .frame(width: width, height: progressBar, alignment: .center)
            }
            .frame(width: width, height: height, alignment: .center)
        }
       
    }
}


