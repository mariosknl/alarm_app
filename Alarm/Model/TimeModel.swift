import Foundation

struct TimeModel: Equatable, Comparable, Identifiable {
    static func < (lhs: TimeModel, rhs: TimeModel) -> Bool {
        (lhs.hours < rhs.hours) || (lhs.hours == rhs.hours && lhs.minutes < rhs.minutes)
    }
    
    let id = UUID()
    let hours: Int
    let minutes: Int
}
