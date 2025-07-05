//
//  GlobalHelpers.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

class GlobalHelpers {
    static func formatInt(_ value: Int?) -> String {
        if let value {
            return String(value)
        }
        return ""
    }

    static func formatDouble(_ value: Double?) -> String {
        if let value {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
        }
        return ""
    }
    
    static func formatTimeAsClock(_ interval: TimeInterval?) -> String {
        if let interval {
            let totalSeconds = Int(interval)
            let hours = totalSeconds / 3600
            let minutes = (totalSeconds % 3600) / 60
            let seconds = totalSeconds % 60
            
            if hours > 0 {
                return String(format: "%d:%02d:%02d", hours, minutes, seconds)
            } else {
                return String(format: "%d:%02d", minutes, seconds)
            }
        }
        return ""
    }
}
