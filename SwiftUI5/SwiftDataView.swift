//
//  SwiftDataView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 08/06/23.
//

import SwiftUI
import SwiftData

struct SwiftDataView: View {
    @Environment(\.modelContext) private var context
    @Query(FetchDescriptor(
        predicate: #Predicate{ $0.isLiked == true},
        sortBy: [SortDescriptor(\.dateAdded, order: .reverse)]),
           animation: .snappy ) private var favourites: [Person]
    
    @Query(FetchDescriptor(
        predicate: #Predicate{ $0.isLiked == false},
        sortBy: [SortDescriptor(\.dateAdded, order: .reverse)]),
           animation: .snappy ) private var normal: [Person]
    
    var body: some View {
        NavigationStack{
            List{
                DisclosureGroup("Favorites"){
                    ForEach(favourites) { person in
                        HStack{
                            Text(person.name)
                            Spacer()
                            Button(action: {
                                person.isLiked.toggle()
                                try? context.save()
                            }, label: {
                                Image(systemName:person.isLiked ?
                                      "suit.heart.fill" : "suit.heart")
                                .tint(.red)
                            })
                        }
                        .swipeActions{
                            Button {
                                context.delete(person)
                                try? context.save()
                            } label:{
                                Image(systemName: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                    
                }
                DisclosureGroup("normal"){
                    ForEach(normal) { person in
                        HStack{
                            Text(person.name)
                            Spacer()
                            Button(action: {
                                person.isLiked.toggle()
                                try? context.save()
                            }, label: {
                                Image(systemName:person.isLiked ?
                                      "suit.heart.fill" : "suit.heart")
                                .tint(.red)
                            })
                        }
                        .swipeActions{
                            Button {
                                context.delete(person)
                                try? context.save()
                            } label:{
                                Image(systemName: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
            }
            .navigationTitle("Swift Data")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("add Item"){
                        let person = Person(name: "John Apple \(Date().formatted())")
                        context.insert(person)
                        do{
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            })
        }
    }
}

#Preview {
    SwiftDataView()
        .modelContainer(for: Person.self)
}

@Model
class Person {
    var name:String
    var isLiked:Bool
    var dateAdded:Date
 
    init(name: String, isLiked: Bool = false, dateAdded: Date = .now) {
        self.name = name
        self.isLiked = isLiked
        self.dateAdded = dateAdded
    }
    
}
