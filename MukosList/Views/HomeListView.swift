//
//  HomeListView.swift
//  MukosList
//
//  Created by Mayuko Inoue on 5/15/20.
//  Copyright © 2020 Mayuko Inoue. All rights reserved.
//

import SwiftUI

struct HomeListView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var showingAddItem = false
    @State var isShowingNewLocationFlow = false
    let greyColor = Color("medium_gray")
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Hello, Mayuko")
                    .padding(.leading, 24)
                    .font(.title)
                    .foregroundColor(Color.white)
                Spacer()
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding(.trailing, 24)
                }.frame(height: 200).background(Color("orange"))
            NewListButton(showAddLocation: $isShowingNewLocationFlow).environment(\.managedObjectContext, self.managedObjectContext)
            Spacer()
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                ListCell(showingAddItem: self.$showingAddItem, location: ShoppingLocation(name: "Trader Joe's")).environment(\.managedObjectContext, self.managedObjectContext)
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
