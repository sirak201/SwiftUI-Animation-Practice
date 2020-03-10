//
//  ContentView.swift
//  SwiftUI_Animation_Practice
//
//  Created by Sirak on 3/9/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var animate  = false
    @State private var circleProgress : CGFloat = 1.0
    
    var body: some View {
        ZStack {
            
            
            RoundedRectangle(cornerRadius: animate ? 0 : 20)
                .fill(Color.blue)
                .shadow(radius: 8)
                .frame(width: 200 , height: 200)
                .overlay(Text("Rotate from the left").foregroundColor(Color.white))
                .rotationEffect(.degrees(animate ? 300 : 0))
                .scaleEffect(animate ? 0.2 : 1 , anchor: .top)
                .animation(.linear)
            
            Circle()
                .trim(from: 0, to: self.circleProgress)
                .stroke(Color.yellow, style: StrokeStyle(lineWidth : 20, lineCap : .round))
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-90))
                .offset(.init(width: 0, height: 300))
                .animation(.easeInOut)
            VStack {
                
                Spacer()
                Button(action: {self.animate.toggle();
                    self.circleProgress = self.animate ? 0.35 : 1}) {
                    Text("Change")
                   
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
