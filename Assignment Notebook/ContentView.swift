//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Samantha Hiles on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = ["First Assignment", "Second Assignment", "Third Assignment", "Fourth Assignment", "Fifth Assignment"]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems, id: \.self) { Assignment in
                    Text(Assignment)
                }
                .onMove(perform: { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { IndexSet in
                    assignmentItems.remove(atOffsets: IndexSet)
                })
            }
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

#Preview {
    ContentView()
}
struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date ()
}
