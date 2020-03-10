//
//  Exercise_Three.swift
//  SwiftUI_Animation_Practice
//
//  Created by Sirak on 3/10/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SwiftUI

struct Exercise_Three: View {
    @State var animate = true
    var body: some View {
        ZStack {
            VStack {
                Text("Challenge")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Show a Menu")
                    .font(.headline)
                    .padding()
                    
                Button(action : {self.animate.toggle()}) {
                    Text("Open Menu").frame(width: 100)
                }.padding()
                
            
                Spacer()
                
                
                RoundedRectangle(cornerRadius: 12)
                    .overlay(VStack {
                        Image(systemName : "slider.horizontal.3")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.white)
                            .padding(.top)
                        Text("My Menu!")
                            .foregroundColor(Color.white)
                            .padding()
                        Spacer()
                    })
                .frame(width: 350, height: 200)
                .foregroundColor(Color.blue)
                .scaleEffect(animate ? 0.2 : 1 , anchor: .bottom)
                .opacity(animate ? 0 : 1)
                .animation(.easeIn)
                .offset(.init(width: 0, height: animate ? 70 : 0))
            }
        }
        
    }
}

struct Exercise_Three_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Three()
    }
}
