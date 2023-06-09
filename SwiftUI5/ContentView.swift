//
//  ContentView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 08/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink("Swift Data") {
                    SwiftDataView()
                        .modelContainer(for:Person.self)
                }
                NavigationLink("Custom Transition") {
                    TransitionView()
                }
                NavigationLink("Date Format") {
                    DateFormat()
                }
                NavigationLink("Context Menu View") {
                    ContextMenuView()
                }
                NavigationLink("Unavailable View") {
                    UnavailableView()
                }
                NavigationLink("ScrollView Paging") {
                    PagingView()
                }
                NavigationLink("ScrollView Positon") {
                    PositionView()
                }
                NavigationLink("ScrollView Transition") {
                    STransitionView()
                }
            }
            .navigationTitle("SwiftUI 5")
        }
        
    }
}

#Preview {
    ContentView()
}
