//
//  ContentView.swift
//  Shared
//
//  Created by michael gunnulfsen on 25/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var nellyData: ObservableNellyData
    
    var body: some View {
        
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("👋\nHey, Nelly")
                    .font(.system(size: 32))
                    .foregroundColor(Color("text"))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.vertical, 62)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                
                
                VStack(alignment: .leading) {
                    
                    
                    VStack(alignment: .leading) {
                        Text("Sist soving 😴")
                            .foregroundColor(Color("text"))
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(getSleepString())
                            .foregroundColor(Color("primary"))
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Sist mat 🌮")
                            .foregroundColor(Color("text"))
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(getFeedString())
                            .foregroundColor(Color("primary"))
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 24) {
                        
                        Button(action: {
                            nellyData.saveFed()
                        }) {
                            Text("Ny mating")
                                .fontWeight(.semibold)
                                .frame(width: 110, height: 80)
                                .background(Color("secundary600"))
                                .frame(width: 110, height: 80)
                                .cornerRadius(16)
                                .foregroundColor(Color("secundary800"))
                                .font(.callout)
                        }
                        
                        Button(action: {
                            nellyData.toggleSleep()
                        }) {
                            Text(getSleepActionString())
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .frame(width: 110, height: 80)
                                .background(Color("text"))
                                .cornerRadius(16)
                                .foregroundColor(Color.white)
                                .font(.callout)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func getSleepString() -> String {
        if let sleepItem = nellyData.sleepItem {
            if (sleepItem.isFinished == true) {
                return "\(formatDateString(sleepItem.endTimestamp)) (slutt)"
            } else {
                return "\(formatDateString(sleepItem.startTimestamp)) (start)"
            }
            
        }
        
        return "-"
    }
    
    func getFeedString() -> String {
        if let feedItem = nellyData.feedItem {
            return "\(formatDateString(feedItem.timestamp))"
        }
        
        return "-"
    }
    
    func getSleepActionString () -> String {
        if let sleepItem = nellyData.sleepItem {
            if (sleepItem.isFinished == true) {
                return "Start\nsoving"
            } else {
                return "Avslutt\nsoving"
            }
        } else {
            return "Start\nsoving"
        }
    }
    
    func formatDateString (_ d: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE dd - HH:mm"
//        formatter.dateStyle = .none
//        formatter.timeStyle = .short
        
        return formatter.string(from: d)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ObservableNellyData())
    }
}
