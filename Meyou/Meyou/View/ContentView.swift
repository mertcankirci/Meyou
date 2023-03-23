//
//  ContentView.swift
//  Meyou
//
//  Created by Mertcan Kırcı on 8.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var question1 : Question
    @State private var i : Int = 0
    @State var colorIs : Bool = false
    @State private var completionAmount = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isTapped : Bool = true
    
    var body: some View {
        
        VStack(spacing: 0){
            
            ZStack{
                
                VStack(spacing: 0){
                    
                    Vertical1(questionModel: question1, isColor: colorIs, isReady1: isTapped)
                        .onReceive(timer) { _ in
                            withAnimation {
                                if completionAmount == 1 {
                                    completionAmount = 0
                                        
                                } else {
                                    completionAmount += 0.4
                                }
                            }
                        }
                        
                        
                    Vertical1(questionModel: question1, isColor: colorIs, isReady1: isTapped)
                        .rotationEffect(.degrees(180))
                        .onReceive(timer) { _ in
                            withAnimation {
                                if completionAmount == 1 {
                                    completionAmount = 0
                                        
                                } else {
                                    completionAmount += 0.4
                                }
                            }
                        }
                    
                }
                Group{
                         Rectangle()
                                .trim(from: 0, to: completionAmount)
                                .stroke(Color(hex: 0x2B3467), lineWidth: 180)
                                .frame(width: 180, height: 250)
                                .cornerRadius(15)
                                .rotationEffect(.degrees(-90))
                                .onReceive(timer) { _ in
                                    withAnimation {
                                        if completionAmount == 1 {
                                            completionAmount = 0
                                                
                                        } else {
                                            completionAmount += 0.4
                                        }
                                    }
                                }
                                
                        
//                        .fill(Color(hex: 0x2B3467))
//                        .frame(width: 250, height: 180)
//                        .cornerRadius(15)
                    VStack{
                        Text("GENERATE")
                            .font(.title)
                            .foregroundColor(Color(hex: 0xFCFFE7))
                            .rotationEffect(.degrees(180))
                        
                        LabelledDivider(label: "click")
                            .frame(width: 250)
                        
                        
                        Text("GENERATE")
                            .font(.title)
                            .foregroundColor(Color(hex: 0xFCFFE7))
                    }
                        
                }
                .offset(x: 0 , y: 0)
            }
            .onTapGesture {
                isTapped.toggle()
                if i <= 51 {
                    i+=1
                    question1 = questionData[i]
                }
                else {
                    return
                }
               
            }
            .onLongPressGesture {
                if i <= 51 && i >= 0 {
                    i-=1
                    question1 = questionData[i]
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(question1: questionData[0])
    }
}
