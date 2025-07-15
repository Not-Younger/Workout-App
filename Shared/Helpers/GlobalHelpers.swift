//
//  GlobalHelpers.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

class GlobalHelpers {
    static func performHaptic() {
        let impact = UIImpactFeedbackGenerator(style: .soft)
        impact.prepare()
        impact.impactOccurred()
    }
    
    static func formatInt(_ value: Int?) -> String {
        if let value {
            return cleanNumberString(String(value))
        }
        return ""
    }
    
    static func cleanIntString(_ value: String) -> (String, Int?) {
        var reps: String = ""
        // Allow only digits
        let filtered = value.filter { "0123456789".contains($0) }
        
        // Remove leading zeros
        let cleaned = String(filtered.drop(while: { $0 == "0" }))
        
        // Avoid empty string if user deletes everything or enters only zeros
        reps = cleaned.isEmpty ? "0" : cleaned

        if let intValue = Int(reps) {
            return (reps, intValue)
        } else {
            return ("", nil)
        }
    }

    static func formatDouble(_ value: Double?) -> String {
        if let value {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            formatter.numberStyle = .decimal
            return cleanNumberString(formatter.string(from: NSNumber(value: value)) ?? "\(value)")
        }
        return ""
    }
    
    static func cleanDoubleString(_ value: String) -> (String, Double?) {// Filter to allow only digits and at most one decimal point
        var weight: String = ""
        let filtered = value.filter { "0123456789.".contains($0) }
        let components = filtered.split(separator: ".", maxSplits: 2, omittingEmptySubsequences: false)
        
        // Helper function to sanitize and handle leading zeros
        func sanitize(_ string: String) -> String {
            var result = string
            
            // Prepend 0 if it starts with "."
            if result.first == "." {
                result = "0" + result
            }
            
            // If it starts with "0" but not "0." (e.g. "007", "0008"), remove leading zeros
            if result.hasPrefix("0") && !result.hasPrefix("0.") {
                result = String(result.drop(while: { $0 == "0" }))
                if result.isEmpty {
                    result = "0"
                }
            }
            
            // Limit to 2 digits after the decimal point
            if let dotIndex = result.firstIndex(of: ".") {
                let afterDecimalIndex = result.index(after: dotIndex)
                let decimalPart = result[afterDecimalIndex...]
                if decimalPart.count > 2 {
                    let endIndex = result.index(dotIndex, offsetBy: 3)
                    result = String(result[..<endIndex])
                }
            }
            
            return result
        }
        
        if components.count > 2 {
            let sanitized = components.prefix(2).joined(separator: ".")
            weight = sanitize(sanitized)
        } else {
            let cleaned = sanitize(filtered)
            if cleaned != value {
                weight = cleaned
            } else {
                weight = value
            }
        }

        if let doubleValue = Double(weight) {
            return (weight, doubleValue)
        } else {
            return ("", nil)
        }
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
    
    static func formattedLongDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a, EEEE, MMM d yyyy"
        return formatter.string(from: date)
    }
    
    static func cleanNumberString(_ input: String) -> String {
        // Remove all commas
        var result = input.replacingOccurrences(of: ",", with: "")
        
        // If there's a decimal point, truncate decimal places to 2 max
        if let dotIndex = result.firstIndex(of: ".") {
            let afterDecimalIndex = result.index(after: dotIndex)
            let decimalPart = result[afterDecimalIndex...]
            
            if decimalPart.count > 2 {
                let endIndex = result.index(dotIndex, offsetBy: 3)
                result = String(result[..<endIndex])
            }
            
            // Remove trailing decimal point if nothing follows it (e.g. "12.")
            if result.last == "." {
                result.removeLast()
            }
        }
        
        return result
    }

}
