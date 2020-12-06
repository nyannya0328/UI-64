//
//  ContentView.swift
//  UI-64
//
//  Created by にゃんにゃん丸 on 2020/12/06.
//

import SwiftUI

struct ContentView: View {
    
    @State var original = ""
    @State var numberCount = 0
    @State var txt = ""
    @State var color :Color = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    @State var color2 :Color = Color(#colorLiteral(red: 0.8379733529, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    
    
    var body: some View {
        VStack(spacing:20){
            
            TextField("CardNumber", text: $original)
                .font(.system(size: 35))
                .keyboardType(.numberPad)
                .foregroundColor(.black)
                
                
                Text("Display")
                    .font(.system(size: 35, weight: .heavy))
                    .foregroundColor(.white)
                    .background(
                    
                        LinearGradient(gradient: .init(colors: [color,color2]), startPoint: .leading, endPoint: .trailing)
                    )
                    
            
                .onChange(of: original, perform: { value in
                    generateCarNumber()
                    stop()
                })
            
        }
        .padding()
    }
    func generateCarNumber(){
        
        let number = original.replacingOccurrences(of: "-", with: "")
        
        if (number.count) % 4 == 0 && !number.isEmpty{
            
            if !String(original.last!).elementsEqual("-"){
                
                original.append("-")
               
            }
        }
    }
    
    func stop(){
        
        let number = original.replacingOccurrences(of: "", with: "")
        
        if (number.count) % 15 == 0 && !number.isEmpty{
            
            
            if !String(original.last!).elementsEqual(""){
                
                
                original.removeLast()
            }
            
        }
        
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
