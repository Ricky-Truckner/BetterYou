//
//  RingView.swift
//  BetterYou2
//
//  Created by Daniel Hernandez on 9/29/23.
//

import SwiftUI

struct customShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}
struct RingView: View {
    @EnvironmentObject var vm:cddatamodel
    var percent: CGFloat = 50
    let width: CGFloat = 130
    let height: CGFloat = 130
    var body: some View {
        let ringvalue = vm.saveValueEntity.first
        let progress = 1 - (ringvalue?.ring ?? 0 / 1000)
        return HStack (spacing: 40) {
            
            
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.1), style: StrokeStyle(lineWidth: 5))
                    .frame(width: width, height: height)
                Circle()
                    .trim(from: CGFloat(progress), to: 1)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("carbs"),.blue]), startPoint: .top, endPoint: .bottom),style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: width, height: height)
            }
            
            
            
            HStack(spacing: 30) {
                
                    foodElementvalue(element: "Carbs", gram: String(format: "%.0f", ""), color: "carbs", elementvalue: 20)
                    
                    foodElementvalue(element: "Fat", gram: String(format: "%.0f", ""), color: "fat", elementvalue: 1000)
                    
                    foodElementvalue(element: "Protein", gram: String(format: "%.0f", ""), color: "protein", elementvalue: 400)

                
                
            }
        }
        .frame(height: 180)
        .background(Color.white)
        .cornerRadius(20)
        .modifier(customShadow())
    }
}



struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView().environmentObject(cddatamodel())
    }
}

struct foodElementvalue:View {
    var element = ""
    var gram = ""
    var color = ""
    var elementvalue: CGFloat = 0
    var body: some View {
        let height: CGFloat = 130
        let multiplier = (height / 2000)
        return VStack{
            ZStack(alignment: .bottom){
                Rectangle()
                    .frame(width: 8, height: 110)
                    .foregroundColor(.gray.opacity(0.5))
                if elementvalue != 0 {
                    Rectangle()
                        .frame(width: 8, height: elementvalue * multiplier)
                        .foregroundColor(Color(color))
                } else {
                    Rectangle()
                        .frame(width: 8, height: 110)
                        .foregroundColor(Color(color))
                }
            }
            .cornerRadius(10)
            Text(element)
                .font(.system(size: 12))
            Text(gram)
                .font(.system(size: 10))
        }
    }
}