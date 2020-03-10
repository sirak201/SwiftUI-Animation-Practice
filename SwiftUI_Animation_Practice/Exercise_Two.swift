//
//  Exercise_Two.swift
//  SwiftUI_Animation_Practice
//
//  Created by Sirak on 3/9/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SwiftUI

struct Exercise_Two: View {
    
    @State var animate  = false

    var body: some View {
        ZStack {
            Rectangle()
            .frame(width: 50, height: 100)
                .rotationEffect(.degrees(animate ? 60 : 90))
                .opacity(animate ? 0 : 1)
                .offset(.init(width: animate ? -150 : -80, height: animate ? 300 : 0))
                .animation(.linear)
            Rectangle()
                .rotationEffect(.degrees(animate ? -60 : 0))
                .opacity(animate ? 0 : 1)
                .frame(width: 50, height: 100)
                .offset(.init(width: animate ? -150 : 0, height: animate ? -300 : -25))
                .animation(.linear)
            Rectangle()
                 .rotationEffect(.degrees(animate ? -60 : 0))
                 .frame(width: 50, height: 100)
                 .opacity(animate ? 0 : 1)
                .offset(.init(width: animate ? 150 : -55, height: animate ? 300 : 78))
                .animation(.linear)
            Rectangle()
                .rotationEffect(.degrees(animate ? 40 : 90))
                .frame(width: 50, height: 100)
                .opacity(animate ? 0 : 1)
                .offset(.init(width: animate ? 80 : 25, height: animate ? -200 : 56))
                .animation(.linear)
            
            
            VStack {
                Spacer()
                Button(action: {self.animate.toggle() } ){
                        Text("Change")
                    }
            }
        }
//        .onAppear(perform: {self.animate.toggle()})
    }
}

struct Exercise_Two_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Two()
    }
}
