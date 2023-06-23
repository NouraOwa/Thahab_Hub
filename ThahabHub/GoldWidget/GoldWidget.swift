//
//  GoldWidget.swift
//  GoldWidget
//
//  Created by Noura Alowayid on 29/11/1444 AH.

import SwiftUI
import WidgetKit

protocol AxWidgetModel: Codable, Hashable, TimelineEntry {
    var date: Date { get }
}

struct AxWidgetDefinition<Model: AxWidgetModel, Content: View> {
    let kind, displayName, description: String
    let previewEntry: Model
    let fallbackEntry: Model
    let supportedFamilies: [WidgetFamily]
    let view: (Model) -> Content
    
    var widget: some Widget {
        AxWidget(definition: self)
    }
    
    var staticConfiguration: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: AxWidgetProvider(definition: self),
            content: view
        )
        .supportedFamilies(supportedFamilies)
        .configurationDisplayName(displayName)
        .description(description)
    }
    
    /// Gets a new entry from flutter or preview value
    func getEntry(isPreview: Bool) -> Model {
        if (isPreview) {
            return previewEntry
        }
        
        return fallbackEntry
    }
}

struct AxWidget<Model: AxWidgetModel, Content: View>: Widget {
    init() {
    }
    
    init(definition: AxWidgetDefinition<Model, Content>) {
        self.init()
        self.definition = definition
    }
    
    var definition: AxWidgetDefinition<Model, Content>?
    
    var body: some WidgetConfiguration {
        definition!.staticConfiguration
    }
}

struct AxWidgetProvider<Model: AxWidgetModel, Content: View>: TimelineProvider {
    let definition: AxWidgetDefinition<Model, Content>
    
    /// First time data
    /// Gives the user a general idea of the widget
    func placeholder(in context: Context) -> Model {
        definition.previewEntry
    }
    
    /// This function should return a “timeline” entry with dummy data. It is used to render the previews in the widget gallery.
    func getSnapshot(in context: Context, completion: @escaping (Model) -> Void) {
        let entry = definition.getEntry(isPreview: context.isPreview)
        completion(entry)
    }
    
    /// Pass “timelines” which allows to update the widget on different time triggers
    func getTimeline(in context: Context, completion: @escaping (Timeline<Model>) -> Void) {
        getSnapshot(in: context) { (entry) in
            
            // Create a date that's 15 minutes in the future.
            let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 1, to: Date())!
            
            let timeline = Timeline(
                entries: [entry],
                policy: .after(nextUpdateDate)
            )
            
            completion(timeline)
        }
    }
}
