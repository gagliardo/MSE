//
//  ComplicationController.swift
//  Meeting Sound Effects WatchKit Extension
//
//  Created by diego gagliardo on 19/04/2017.
//  Copyright © 2017 gagliardo. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        if complication.family == .utilitarianSmall {
            let template = CLKComplicationTemplateUtilitarianSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "")
            template.fillFraction = self.dayFraction
            handler(template)
        } else {
        handler(nil)
        }
    }
    var dayFraction : Float {
        let now = Date()
        let calendar = Calendar.current
        let componentFlags = Set<Calendar.Component>([.year, .month, .day, .weekOfYear,     .hour, .minute, .second, .weekday, .weekdayOrdinal])
        var components = calendar.dateComponents(componentFlags, from: now)
        components.hour = 0
        components.minute = 0
        components.second = 0
        let startOfDay = calendar.date(from: components)!
        return Float(now.timeIntervalSince(startOfDay)) / Float(24*60*60)
    }
    
    
}
