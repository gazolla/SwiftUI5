//
//  UnavailableView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 09/06/23.
//

import SwiftUI

//ContentUnavailableView allows you to handle cases of networking failure or empty search results. It’s essential to explain an empty state and its cause to your users.

struct UnavailableView: View {
    @State private var emptyList:[String] = []
    var body: some View {
        List{
            ForEach(emptyList, id:\.self){ item in
                Text(item)
            }
        }
        .overlay {
            if emptyList.isEmpty {
                ContentUnavailableView.search
            }
        }
    }
}

#Preview {
    UnavailableView()
}
