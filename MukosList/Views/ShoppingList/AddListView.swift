//
//  AddLocationView.swift
//  MukosList
//
//  Created by Mayuko Inoue on 5/10/20.
//  Copyright © 2020 Mayuko Inoue. All rights reserved.
//

import SwiftUI

enum SetupState {
    case naming, location, sharing
    
    var title: String {
        switch(self) {
        case .naming:
            return "Make a New List"
        case .location:
            return "Set Your Store"
        case .sharing:
            return "Share Your List"
        }
    }
}

struct AddListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentation
        
    @State var setupState: SetupState = .naming
    
    var body: some View {
        VStack {
            Spacer().frame(height:16)
            HStack {
                Rectangle().frame(height:8).foregroundColor(colorFor(setupState: .naming))
                Rectangle().frame(height:8).foregroundColor(colorFor(setupState: .location))
                Rectangle().frame(height:8).foregroundColor(colorFor(setupState: .sharing))
            }.padding(.horizontal)
            ZStack {
                HStack {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Image("back").renderingMode(.template).foregroundColor(Color("gray_dark"))
                    }.padding(.leading, 28)
                    Spacer()
                }
                Text(self.setupState.title)
                    .font(.system(size:24, weight:.semibold, design:.default))
                    .foregroundColor(Color("gray_dark"))
            }.padding(.vertical)
            if(setupState == .naming) {
                NameListView(setupState: self.$setupState)
            } else {
                Text("henlo")
            }
        }
    }
    
    func colorFor(setupState: SetupState) -> Color {
        if(setupState == self.setupState) {
            return Color("orange")
        } else {
            return Color("gray_light")
        }
    }
}


struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
    }
}
