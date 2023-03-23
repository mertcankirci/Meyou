//
//  Vertical2.swift
//  Meyou
//
//  Created by Mertcan Kırcı on 8.01.2023.
//

import SwiftUI

struct Vertical2: View {
    var questionModel : Question
    @State private var isColor: Bool = false
    @State private var color = Color(hex: 0xfcffe7)
    @State var isReady1 : Bool = false
    var body: some View {
        VStack {
            VStack{
                ZStack {
                    Capsule()
                        .fill(color)
                        .frame(width: 300, height: 150)
                    
                    Text(questionModel.name)
                        .frame(width: 250, height: 150)
                }
                .onTapGesture {
                    isColor.toggle()
                    
                    if isColor {
                        color = Color(hex: 0xC0EEE4)
                        isReady1.self = true
                        
                    }
                    else {
                        color = Color(hex: 0xfcffe7)
                        isReady1.self = false
                    }
                }
            }
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2)
        .background(Color(hex: 0xFFCAC8))
    }
}

struct Vertical2_Previews: PreviewProvider {
    static var previews: some View {
        Vertical2(questionModel: questionData[0])
    }
}
