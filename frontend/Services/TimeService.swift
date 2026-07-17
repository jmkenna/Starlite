//
//  TimeService.swift
//  Starlite
//
//  Created by Martin McKenna on 7/17/26.
//
import SwiftUI
//decimal time UTC
func getTime() -> Double {
    return 0.0
}

//days since Jan 1, 2000, 12:00 UTC
func getDate() -> Int {
    let calendar = Calendar.current
    var components = DateComponents()
    components.year = 2000
    components.month = 1
    components.day = 1
    
    guard let targetDate = calendar.date(from: components) else { return 0 }
    let startDate = calendar.startOfDay(for: targetDate)
    let endDate = calendar.startOfDay(for: .now)
    let daysSince = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day!
//    let years = Calendar.current.dateComponents([.year], from: now).year!
//    let months = Calendar.current.dateComponents(Set([.month]), from: now).month!
//    let days = Calendar.current.dateComponents([.day], from: now).day!
//    let daysSince = ((years - 2000) * 365) + days
    return daysSince
}

