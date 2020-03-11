//
//  Exercise_Four.swift
//  SwiftUI_Animation_Practice
//
//  Created by Sirak on 3/10/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SwiftUI

struct Exercise_Four: View {
    @State var showPopUp : Bool = false
    @GestureState private var dragOffset = CGSize.zero
    @State private var currentOffSet = CGSize.zero



    
    var drag : some Gesture {
        DragGesture()
            .updating($dragOffset) { (value, state, transaction) in
                
                state = value.translation
        }
            .onEnded{ value in
                
                self.currentOffSet = value.translation
                if value.translation.height > 50 || value.translation.width > 50{
                    self.currentOffSet = .zero
                    self.showPopUp.toggle()
                }
        }
    }
    
    
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("Triggers")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                Text("Show Popup")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                
                
                
                
                Button(action : {self.showPopUp.toggle()}) {
                    Text("Show Popup")
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    Text("Drag pop of the screen")
                    
                    Spacer()

                    }
                    
                .padding()
                 .background(Color.yellow)
                 .cornerRadius(12)
                Spacer()
                 Text("You can also tap to dismiss popup to close ")
                    
                Spacer()
                
                Button(action : {}) {
                    Text("Or Tap This button to close")
                }
            }
            
            .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color.white).shadow(radius: 12))
            .opacity(showPopUp ? 1 : 0)
                .offset(.init(width: showPopUp ? dragOffset.width + currentOffSet.width : 0, height: showPopUp ? dragOffset.height +  currentOffSet.height : 0))
            .gesture(drag)
        
            .animation(.easeIn)
            
            .frame(width: 350, height: 200)
        }
    }
}

struct Exercise_Four_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Four()
    }
}
