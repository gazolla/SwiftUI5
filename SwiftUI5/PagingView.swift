//
//  PagingView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 08/06/23.
//

import SwiftUI

struct PagingView: View {
    var body: some View {
        ScrollView(.horizontal){
            let colors:[Color] = [.red,.blue,.green,.yellow,.purple]
            LazyHStack(spacing:0){
                ForEach(colors, id:\.self){ color in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(color.gradient)
                        .frame(maxWidth: .infinity, maxHeight:.infinity)
                        .padding(.horizontal)
                        .containerRelativeFrame(.horizontal)
                }
            }
            .scrollTargetLayout()
        }
      //  .edgesIgnoringSafeArea(.all)
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    PagingView()
}
