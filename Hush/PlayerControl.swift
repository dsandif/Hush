//
//  PlayerControl.swift
//  Hush
//
//  Created by Darien Sandifer on 12/17/22.
//

import SwiftUI

struct PlayerControl: View {
    let category: Category
    @State var isPlaying: Bool = false
  
    var body: some View {
      HStack{
        VStack(alignment: .leading){
          AppLogo(category: category)
            .padding([.leading,.top], 0)
          HStack(alignment: .top){
            VStack(alignment: .leading){
              Text("All I need")
                .foregroundColor(.gray)
                .font(.caption)
              Text("Lee Fields & The Expressions")
                .font(.caption2)
            }.fontWeight(.light)
          }
        }
        
        VStack{
          HStack(alignment: .center, spacing: 20){
            Button(action: {print("tapped")}){
              Image(systemName: "backward.fill")
                .frame(width: 12, height: 12)
                .aspectRatio(contentMode: .fit)
                .padding(12)
                .clipShape(Circle())
                .overlay(Circle().stroke(.clear, lineWidth: 0.3))
                .scaledToFit()
                .contentShape(Rectangle())
                .onTapGesture {
                    print("back tapped")
                }
            }.buttonStyle(ActiveBorderStyle())
            
            Button(action:{}){
              Image(systemName: isPlaying ? "pause":"play")
                .frame(width: 12, height: 12)
                .aspectRatio(contentMode: .fit)
                .padding(12)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 0.3))
                .scaledToFit()
                .contentShape(Rectangle())
                .onTapGesture {
                    isPlaying.toggle()
                    print("play tapped")
                }
            }.buttonStyle(ActiveBorderStyle())
            
            Button(action: {print("tapped")}){
              Image(systemName: "forward.fill")
                .frame(width: 12, height: 12)
                .aspectRatio(contentMode: .fit)
                .padding(12)
                .clipShape(Circle())
                .overlay(Circle().stroke(.clear, lineWidth: 0.3))
                .scaledToFit()
                .contentShape(Rectangle())
                .onTapGesture {
                    print("forward tapped")
                }
            }.buttonStyle(ActiveBorderStyle())
          }
          HStack(alignment: .center){
            Text("2:29").foregroundColor(.gray)
            Rectangle().frame(height: 3).foregroundColor(.gray.opacity(0.3))
            Text("3:54").foregroundColor(.gray)
          }
          .font(.caption2)
          .padding([.bottom],10)
          .fontWeight(.ultraLight)
          
        }.padding(.horizontal, 20)
      }
    }
}

struct ActiveBorderStyle: ButtonStyle {
    var showBorder: Bool = false
    init(border: Bool = false) {
      self.showBorder = border
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .overlay((showBorder || configuration.isPressed) == true ?
              Circle().stroke(.gray, lineWidth: configuration.isPressed ? 1: 0.3)
                .foregroundColor(configuration.isPressed ? .gray : .clear) : nil
            )
    }
}

struct PlayerControl_Previews: PreviewProvider {
    static var previews: some View {
      VStack{
        ForEach(Category.allCases){ cat in
          PlayerControl(category: cat, isPlaying: .random())
          Divider()
        }
      }.padding()
    }
}
