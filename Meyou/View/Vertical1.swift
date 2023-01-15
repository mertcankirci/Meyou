//
//  Vertical1.swift
//  Meyou
//
//  Created by Mertcan Kırcı on 8.01.2023.
//

import SwiftUI

struct Vertical1: View {
    
    @EnvironmentObject var network : Network
    var questionModel : Question
    @State var isColor: Bool
    @State private var color = Color(hex: 0xfcffe7)
    @State var isReady1 : Bool
    @State private var completionAmount = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
   
    var body: some View {
        
        
            VStack{
                ZStack {
                    Rectangle()
                        .trim(from: 0, to: completionAmount)
                        .stroke(color, lineWidth: 170)
                        .frame(width: 170, height: 260)
                        .cornerRadius(15)
                        .rotationEffect(.degrees(-90))
                        .onReceive(timer) { _ in
                            withAnimation {
                                completionAmount += 1
                            }
                        }
                    
                    
                    //.fill(color)
                    //                    .frame(width: 260, height: 170)
                    //                    .cornerRadius(15)
                    
                    
                    Text(questionModel.name)
                        .rotationEffect(.degrees(180))
                        .frame(width: 230, height: 170, alignment: .center)
                        .foregroundColor(Color(hex: 0x2B3467))
                    
                    
                }
                .onTapGesture {
                    isColor.toggle()
                    
                    if isColor {
                        color = Color(hex: 0xc0eee4)
                        isReady1.self = true
                        
                    }
                    else {
                        color = Color(hex: 0xfcffe7)
                        isReady1.self = false
                    }
                    
                }
                
            }
            .onAppear(perform: network.readFile)
            
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2)
            .background(Color(hex: 0xEB455F))
        
        
        }
        
    
        
}

struct Vertical1_Previews: PreviewProvider {
    static var previews: some View {
        Vertical1(questionModel: questionData[0], isColor: false, isReady1: false)
            .environmentObject(Network())
    }
}
