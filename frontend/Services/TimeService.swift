//
//  TimeService.swift
//  Starlite
//
//  Created by Martin McKenna on 7/17/26.
//
import SwiftUI
//returns hour decimal time UTC
func getTime() -> Double {
    let now = Date()
    let comp = Calendar.current.dateComponents(in: TimeZone(abbreviation: "UTC") ?? Calendar.current.timeZone, from: now)
    
    return (Double(comp.hour!)) + (Double(comp.minute!) / 60.0) + (Double(comp.second!) / 3600.0)
}

//days since Jan 1, 2000, 12:00 UTC
func getDate() -> Int {
    let calendar = Calendar.current
    var components = DateComponents()
    components.year = 2000
    components.month = 1
    components.day = 1
    //components.timeZone = TimeZone(abbreviation: "UTC")!
    components.hour = 0
    components.minute = 0
    components.second = 0
    
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

