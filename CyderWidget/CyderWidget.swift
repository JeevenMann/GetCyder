//
//  CyderWidget.swift
//  CyderWidget
//
//  Created by Navjeeven Mann on 2023-03-18.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct CyderWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
                .ignoresSafeArea()
            VStack {
                
                Text("**1400**")
                
                Text("Tokens Collected")
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .ignoresSafeArea()
        .background(Color("WidgetBackground"))
    }
}

struct CyderWidget: Widget {
    let kind: String = "CyderWidget"

    var body: some WidgetConfiguration {
        
     
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            CyderWidgetEntryView(entry: entry)
                .background(Color("WidgetBackground"))

        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget for Cyder.")
    }
}

struct CyderWidget_Previews: PreviewProvider {
    static var previews: some View {
        CyderWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
