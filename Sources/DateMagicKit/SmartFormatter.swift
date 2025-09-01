//
//  SmartFormatter.swift
//  DateMagicKit
//
//  Created by Nobin Nepolian on 01/09/2025.
//

import Foundation

public enum SmartFormatter {
    
    public enum Style {
        case shortDate
        case longDate
        case timeOnly
        case smartDate
        case iso
    }

    // Parse multiple input types
    public static func parse(input: Any) -> Date? {
        switch input {
        case let date as Date:
            return date
        case let time as TimeInterval:
            return Date(timeIntervalSince1970: time)
        case let str as String:
            if let timestamp = TimeInterval(str) {
                return Date(timeIntervalSince1970: timestamp)
            }
            let formatter = ISO8601DateFormatter()
            return formatter.date(from: str)
        default:
            return nil
        }
    }
    
    // Format date with style
    public static func display(_ input: Any, style: Style = .smartDate) -> String {
        guard let date = parse(input: input) else { return "-" }
        
        let formatter = DateFormatter()
        formatter.locale = .current
        
        switch style {
        case .shortDate:
            formatter.dateStyle = .short
            formatter.timeStyle = .none
        case .longDate:
            formatter.dateStyle = .long
            formatter.timeStyle = .none
        case .timeOnly:
            formatter.dateStyle = .none
            formatter.timeStyle = .short
        case .smartDate:
            let calendar = Calendar.current
            if calendar.isDateInToday(date) {
                formatter.dateFormat = "h:mm a"
            } else if calendar.isDateInYesterday(date) {
                return "Yesterday"
            } else {
                formatter.dateStyle = .medium
                formatter.timeStyle = .none
            }
        case .iso:
            let isoFormatter = ISO8601DateFormatter()
            return isoFormatter.string(from: date)
        }
        return formatter.string(from: date)
    }
    
    // Relative time for seconds in the future
    public static func shortFuture(seconds: Int, locale: Locale = .current) -> String {
        if seconds < 60 { return "in a few seconds" }
        if seconds < 3600 { return "in \(seconds/60)m" }
        if seconds < 86400 { return "in \(seconds/3600)h" }
        return "in \(seconds/86400)d"
    }
}
