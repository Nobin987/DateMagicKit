//
//  SmartDateText.swift
//  DateMagicKit
//
//  Created by Nobin Nepolian on 01/09/2025.
//


import SwiftUI

public struct SmartDateText: View {
    let input: Any
    let style: SmartFormatter.Style
    let color: Color?
    let font: Font?
    
    public init(_ input: Any, style: SmartFormatter.Style = .smartDate, color: Color? = nil, font: Font? = nil) {
        self.input = input
        self.style = style
        self.color = color
        self.font = font
    }
    
    public var body: some View {
        Text(SmartFormatter.display(input, style: style))
            .foregroundColor(color)
            .font(font)
    }
}