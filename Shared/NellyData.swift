//
//  NellyData.swift
//  Hey Nelly
//
//  Created by michael gunnulfsen on 25/04/2021.
//

import Foundation

let appGroup = "group.com.jazzlabs.HeyNelly"
let SLEEP_ITEM_KEY = "SleepItem"
let FEED_ITEM_KEY = "FeedItem"

struct FeedItem : Codable, Identifiable {
    var id = UUID()
    var timestamp: Date
}

struct SleepItem : Codable, Identifiable {
    var id = UUID()
    var startTimestamp: Date
    var endTimestamp: Date
    var isFinished: Bool
}

func readLastSleep(completion: (SleepItem) -> ()) {
    let defaults = UserDefaults(suiteName: appGroup)!
    
    if let lastSleep = defaults.object(forKey: SLEEP_ITEM_KEY) as? Data {
        let decoder = JSONDecoder()
        if let loadedLastSleep = try? decoder.decode(SleepItem.self, from: lastSleep) {
            print(loadedLastSleep.startTimestamp)
            completion(loadedLastSleep)
        }
    }
}

func readLastFed(completion: (FeedItem) -> ()) {
    let defaults = UserDefaults(suiteName: appGroup)!
    
    if let lastFeed = defaults.object(forKey: FEED_ITEM_KEY) as? Data {
        let decoder = JSONDecoder()
        if let loadedLastFed = try? decoder.decode(FeedItem.self, from: lastFeed) {
            print(loadedLastFed.timestamp)
            completion(loadedLastFed)
        }
    }
}
