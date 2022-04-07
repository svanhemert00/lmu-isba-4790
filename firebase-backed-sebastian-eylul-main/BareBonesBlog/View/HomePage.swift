//
//  HomePage.swift
//  BareBonesBlog
//
//  Created by eylul on 4/3/22.
//

import SwiftUI

struct HomePage: View {
    @State private var isPressed = false

    var body: some View {
        VStack{
            Group {
                Text("Blog 4 Gamers")
                    .font(.title)
                    .fontWeight(.bold)
      
                Text("BEST GAMING BLOG EV3R")
                    .font(.subheadline)
                
                Text("click me!")
                    .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xSmall/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.center)
            
                Button {
                withAnimation {
                    isPressed.toggle()
                }
    
                } label: {
                    Label( "", systemImage: "heart.fill")
                        .foregroundColor(.accentColor)
                        .rotationEffect(.degrees(isPressed ? 360 : 0))
            }

            }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.accentColor, lineWidth: 6))
        }

    }

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
    HomePage()
    }
}
