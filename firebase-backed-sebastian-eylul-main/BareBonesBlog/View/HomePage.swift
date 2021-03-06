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
                    .foregroundColor(.primary)
      
                Text("This is a blog for gamers, share your opinion on your favorite game, character or more!")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                
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
                    Label( "", systemImage: "gamecontroller.fill")
                        .foregroundColor(.secondary)
                        .rotationEffect(.degrees(isPressed ? 360 : 0))
            }

            }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primary, lineWidth: 6))
        }

    }

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
    HomePage()
    }
}
