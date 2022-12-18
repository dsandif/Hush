//
//  ContentView.swift
//  Hush
//
//  Created by Darien Sandifer on 10/28/22.
//

import SwiftUI
import SimplyCoreAudio
import Liquid

struct ContentView: View {
    @EnvironmentObject var sca: SysAudioManager
    @State var selectedDevice: AudioDeviceObject?
    @State var searchtext: String = ""
    @State var searching = false
    
  var body: some View {
      VStack(alignment: .leading){
        List {
          ConnectionHeader()
          SearchBar(searchText: $searchtext, searching: $searching)
          Text("Other Sources".uppercased()).bold().font(.caption2)
            .foregroundColor(.secondary)
          ForEach(sca.devices, id: \.self) { device in
            HStack{
              icon
              Text(device.name)
//              Text(device.uid)
            }
            .foregroundColor(.white)
            .font(.caption)
          }
          Spacer()
          Text("Apps".uppercased()).bold().font(.caption2)
            .foregroundColor(.secondary)
          ForEach(Category.allCases){cat in
            PlayerControl(category: cat).frame(width: 350)
            Divider()
              .padding(0)
          }
        }
        
        Divider()
        HStack(spacing: 5){
          Image(systemName: "slider.horizontal.3")
          Text("Preferences")
            .foregroundColor(.gray)
        }.padding([.leading], 15)
        Spacer()
      }
      .frame(width: 400)
    }
  
    var icon: some View{
      ZStack {
//        Light Background
//        Liquid(samples: 6,period: 2)
//          .frame(width: 26, height: 26)
//          .foregroundColor(.mint)
//          .opacity(0.5)
//        Liquid(samples: 6,period: 2)
//          .frame(width: 24, height: 24)
//          .foregroundColor(.indigo)
//          .opacity(0.3)
//        Liquid(samples: 6,period: 2)
//          .frame(width: 22, height: 22)
//          .foregroundColor(.cyan)
//
//          Text("Liquid").font(.largeTitle).foregroundColor(.white)
        
        
        //Dark Background
          Liquid(samples: 2, period: 2)
          .frame(width: 20, height: 0.9)
            .foregroundColor(.mint)
            .opacity(0.5)
          Liquid(samples: 6, period: 2)
          .frame(width: 18, height: 0.7)
            .foregroundColor(.indigo)
            .opacity(1)
          Liquid(samples: 6, period: 1)
            .frame(width: 16, height: 1)
            .foregroundColor(.cyan)
      }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SysAudioManager())
    }
}
