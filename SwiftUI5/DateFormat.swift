//
//  FormatDate.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 08/06/23.
//

import SwiftUI

struct DateFormat: View {
    let now = Date( )
    var body: some View {
        NavigationStack{
            List {
                // 03/09/2023, 3:16 PM
                Text (now.formatted())
                // 3:17:05 PM
                Text (now.formatted(date: .omitted, time: .standard))
                // Mar 9, 2023 at 3:15:26 PM CST
                Text (now.formatted(date: .abbreviated, time: .complete))
                // March 9, 2023
                Text (now.formatted(date: .long, time: .omitted))
                // 3/9/2023
                Text (now.formatted(date: .numeric, time: .omitted))
                // 2023-03-09T21:18:05Z
                Text (now.formatted(.iso8601))
                // 9
                Text (now, format:Date.FormatStyle().day())
                // Mar 9
                Text (now, format:Date.FormatStyle().day().month ())
                // 03/9
                Text (now, format:Date.FormatStyle().day().month(.twoDigits))
                // Mar 9, 2023
                Text (now, format: Date.FormatStyle().day() .month().year())
            }
            .navigationTitle("Date Format")
        }
    }
}

#Preview {
    DateFormat()
}
