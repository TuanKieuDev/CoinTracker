//
//  Utils.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import Foundation

func after(interval: TimeInterval, completion: (() -> Void)?) {
    DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
        completion?()
    }
}

func timeAgo(from timestamp: Int) -> String {
    let currentDate = Date()
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    
    let calendar = Calendar.current
    let components = calendar.dateComponents([.minute, .hour, .day, .weekOfYear], from: date, to: currentDate)
    
    if let week = components.weekOfYear, week >= 1 {
        // More than a week ago, display date only
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
        
    } else if let day = components.day, day >= 1 {
        // Between 1 day and less than a week
        return day == 1 ? "1 day ago" : "\(day) days ago"
        
    } else if let hour = components.hour, hour >= 1 {
        // Between 1 hour and less than a day
        return hour == 1 ? "1 hour ago" : "\(hour) hours ago"
        
    } else if let minute = components.minute, minute >= 1 {
        // Less than an hour
        return minute == 1 ? "1 minute ago" : "\(minute) minutes ago"
        
    } else {
        // Just now (less than a minute)
        return "Just now"
    }
}
