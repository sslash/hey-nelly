//
//  ObservableNellyData.swift
//  Hey Nelly
//
//  Created by michael gunnulfsen on 25/04/2021.
//

import Foundation
import SwiftUI

class ObservableNellyData: ObservableObject {
  @Published var sleepItem: SleepItem? {
    didSet {
        UserDefaults(suiteName: appGroup)!.set(try? JSONEncoder().encode(sleepItem), forKey: SLEEP_ITEM_KEY)
    }
  }
    
    @Published var feedItem: FeedItem? {
      didSet {
        UserDefaults(suiteName: appGroup)!.set(try? JSONEncoder().encode(feedItem), forKey: FEED_ITEM_KEY)
      }
    }
  
  init() {
    sleepItem = UserDefaults(suiteName: appGroup)!.data(forKey: SLEEP_ITEM_KEY).flatMap {
      try? JSONDecoder().decode(SleepItem.self, from: $0)
    }
    
    feedItem = UserDefaults(suiteName: appGroup)!.data(forKey: FEED_ITEM_KEY).flatMap {
      try? JSONDecoder().decode(FeedItem.self, from: $0)
    }
  }
  
    func saveFed () {
        feedItem = FeedItem(timestamp: Date())
    }

    func toggleSleep () {
        if let item = sleepItem {
            if (item.isFinished == true) {
                sleepItem = SleepItem(id: UUID(), startTimestamp: Date(), endTimestamp: Date(), isFinished: false)
            } else {
                sleepItem!.endTimestamp = Date()
                sleepItem!.isFinished = true
            }
        } else {
            sleepItem = SleepItem(startTimestamp: Date(), endTimestamp: Date(), isFinished: false)
        }
    }
}
