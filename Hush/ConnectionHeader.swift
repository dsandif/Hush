//
//  ConnectionHeader.swift
//  Hush
//
//  Created by Darien Sandifer on 12/16/22.
//

import SwiftUI
import Liquid

struct ConnectionHeader: View {
    let status = "connected"
    let name = "2 x Apple Homepods \n1 x Echo dot \n2 x Echo"
    let subsystem = "stereo group"
  
    var body: some View {
      HStack{
        VStack(alignment: .leading) {
          HStack(alignment: .center, spacing: 3) {
            Circle()
              .frame(width: 5, height: 5)
              .padding(.trailing,5)
            Text(status.uppercased()).bold().font(.caption2)
            Spacer()
          }
          .foregroundColor(.green)
          
          Text(subsystem.uppercased()).bold().font(.caption2)
          Text(name).bold().font(.caption2).foregroundColor(.gray)
        }
        
        Image(systemName: "homepod.and.homepodmini.fill")
          .font(.largeTitle)
      }
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

struct ConnectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionHeader()
    }
}
