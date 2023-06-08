//
//  SwiftUI5App.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 08/06/23.
//

import SwiftUI

@main
struct SwiftUI5App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
