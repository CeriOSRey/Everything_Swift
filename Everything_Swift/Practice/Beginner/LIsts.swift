//
//  LIsts.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct LIsts: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    @State var vegies: [String] = [
        "carrots", "bokchoi", "lettuce", "cabbage"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruits in
                        Text(fruits.capitalized)
                            .font(.caption)
                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .background(Color.pink)
                    }
                    .onDelete(perform: { indexSet in
                        fruits = removeFruit(fruits, indexSet)
                    })
                    .onMove(perform: moveFruit)
                    .listRowBackground(Color.pink)
                } header: {
                    HStack {
                        Text("Fruits".capitalized)
                        Image(systemName: "flame.fill")
                    }
                    .font(.headline)
                    .foregroundColor(.orange)
                }
                
                Section {
                    ForEach(vegies, id: \.self) { veg in
                        Text(veg.capitalized)
                    }
                } header: {
                    Text("Veggies")
                }

                
            }
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addFruit()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .tint(.purple)
        }
    }
    
    func removeFruit<T>(_ inputArray: Array<T>, _ indexSet: IndexSet) -> Array<T> {
        var newArray = inputArray
        newArray.remove(atOffsets: indexSet)
        return newArray
    }
    
    func moveFruit(_ indexSet: IndexSet,_ newOffset: Int) {
        fruits.move(fromOffsets: indexSet, toOffset: newOffset)
    }
    
    func addFruit() {
        fruits.append("Coconut")
    }
}

struct LIsts_Previews: PreviewProvider {
    static var previews: some View {
        LIsts()
    }
}
