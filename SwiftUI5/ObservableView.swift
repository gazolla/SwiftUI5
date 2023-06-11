//
//  ObservableView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 09/06/23.
//

import SwiftUI
import SwiftData

struct ObservableView: View {
    @Bindable var user: User = .init()
    var body: some View {
        
        NavigationStack {
            VStack{
                List{
                    Section{
                        TextField("Name", text:$user.name)
                        TextField("Password", text:$user.pwd)
                    }
                    Section {
                        Button("Login"){
                            print(user.name)
                            print(user.pwd)
                        }
                    }
                }
            }
            .navigationTitle("Login")
            
        }
        
    }
}

#Preview {
    ObservableView()
}

@Observable
class User {
    var name:String = ""
    var pwd:String = ""
}
