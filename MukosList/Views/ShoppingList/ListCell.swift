//
//  ListCell.swift
//  MukosList
//
//  Created by Mayuko Inoue on 5/17/20.
//  Copyright © 2020 Mayuko Inoue. All rights reserved.
//

import SwiftUI

struct ListCell: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Binding var presentAddItemView: Bool
    var list: ShoppingList
    @State var notShowingNewListFlow = false
    
    var body: some View {
        HStack {
            Button(action: {
                self.presentAddItemView = true
            }) {
                Image("add_yellow")
            }.sheet(isPresented: self.$presentAddItemView) {
                ShoppingItemsView(isBeingPresented: self.$presentAddItemView, listName: self.list.name ?? "idk").environment(\.managedObjectContext, self.managedObjectContext)
            }
            VStack(alignment:.leading){
                Text(list.name ?? "N/A")
                    .font(.headline)
                
                Text("\(list.shoppingItems!.count) items")
                    .font(.subheadline)
            }
            .padding(.leading, 15.0)
            Spacer()
            Button(action: {
                //edit options
            }) {
                Image("ellipsis")
            }
        }
        .frame(height: 60.0)
    }
}
