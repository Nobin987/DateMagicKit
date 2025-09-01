//
//  RelativeTimeText.swift
//  DateMagicKit
//
//  Created by Nobin Nepolian on 01/09/2025.
//


import SwiftUI
import Combine

public struct RelativeTimeText: View {
    let input: Any
    let locale: Locale
    
    @State private var now: Date = Date()
    private let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    public init(_ input: Any, locale: Locale = .current) {
        self.input = input
        self.locale = locale
    }
    
    public var body: some View {
        Text(relativeString())
            .onReceive(timer) { _ in
                now = Date()
            }
    }
    
    private func relativeString() -> String {
        guard let date = SmartFormatter.parse(input: input) else { return "-" }
        
        let seconds = Int(now.timeIntervalSince(date))
        
        if seconds < 0 {
            return SmartFormatter.shortFuture(seconds: -seconds, locale: locale)
        }
        
        if seconds < 60 { return "Just now" }
        if seconds < 3600 { return "\(seconds / 60)m ago" }
        if seconds < 86400 { return "\(seconds / 3600)h ago" }
        return "\(seconds / 86400)d ago"
    }
}
