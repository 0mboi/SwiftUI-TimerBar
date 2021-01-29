//
//  TimerApp.swift
//  Timer
//
//  Created by Christopher Hicks on 1/28/21.
//

import SwiftUI

@main
struct TimerApp: App {
    
    @StateObject var model: TimerModel = TimerModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
