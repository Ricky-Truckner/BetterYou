//
//  AddView.swift
//  BetterYou2
//
//  Created by Daniel Hernandez on 10/5/23.
//

import SwiftUI
struct meal: Identifiable {
    var id = UUID()
    var image: String
}

var icons:[meal] = [
    meal(image: "m1"),
    meal(image: "m2"),
    meal(image: "m3"),
    meal(image: "m4"),
    meal(image: "m5"),
    meal(image: "m6"),
    meal(image: "m7"),
    meal(image: "m8")


]

struct AddView: View {
    @Environment(\.presentationMode) var envi
    @EnvironmentObject var vm:cddatamodel
    @State var itemselected: Tab = .Breakfast
    @State var showicons: Bool = false
    @State var icon: String = "plus2"
    @State var name: String = ""
    @State var title: String = ""
    @State var fat: String = "0"
    @State var protein: String = "0"
    @State var carbs: String = "0"
    @State var fatTF: Bool = false
    @State var proteinTF: Bool = false
    @State var carbsTF: Bool = false


    var body: some View {
        VStack {
            Spacer()
            TabView(itemselected: $itemselected)
            VStack(spacing: 25) {
                Image(icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        withAnimation {
                            showicons.toggle()
                        }
                    }
                if showicons {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(icons) { item in
                                Image(item.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .onTapGesture {
                                        icon = item.image
                                        withAnimation {
                                            showicons.toggle()
                                        }
                                    }
                                    
                            }
                        }
                        
                    }
                }
                VStack {
                    TextField("Name", text: $name)
                    Divider()
                    TextField("Name", text: $title)
                }
                
                .font(.title3)
                .padding()
                .background(.white) // name color section
                .cornerRadius(10)
                VStack {
                    values(number: $fat, show: $fatTF, name: "Fat")
                    values(number: $protein, show: $proteinTF, name: "Protein")
                    values(number: $carbs, show: $carbsTF, name: "Carbs")
                }
                .padding()
                .background(.white) // color for fats/protein/carbs
                .cornerRadius(20)
                Button(action: {
                    
                    switch itemselected {
                    case .Breakfast:
                        vm.addBreakfast(icon: icon, name: name, ingredients: title, fat: CGFloat(Int(fat) ?? 0), protein: CGFloat(Int(protein) ?? 0), carbs: CGFloat(Int(carbs) ?? 0) )
                        envi.wrappedValue.dismiss()

                    case .Lunch:
                        vm.addLunch(icon: icon, name: name, ingredients: title, fat: CGFloat(Int(fat) ?? 0), protein: CGFloat(Int(protein) ?? 0), carbs: CGFloat(Int(carbs) ?? 0) )
                        envi.wrappedValue.dismiss()

                    case .Dinner:
                        print("Dinner")
                    case .Snacks:
                        print("Snacks")
                    }
                    
                }, label: {
                    Text("Save").bold()
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 180, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                })
            }
            .padding()
            Spacer()
        }
        .overlay(alignment: .topTrailing, content: {
            Button(action: {
                envi.wrappedValue.dismiss()
            }, label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                .padding()
            })
        })
        
    }
    
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}

struct values: View {
    @Binding var number:String
    @Binding var show:Bool
    var name = ""
    
    var body: some View {
        HStack {
            Text(name).bold()
                .font(.title2)
            Spacer()
            Text("\(number)").bold()
                .frame(width: 45, height: 30)
                .background(.black)
                .cornerRadius(5)
                .foregroundColor(.white)
                .onTapGesture {
                    withAnimation{
                        show.toggle()
                    }
                }
            if show {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(1 ..< 100) { item in
                            Text("\(item)").bold()
                                .frame(width: 30, height: 30)
                                .background(.black.opacity(0.2))
                                .cornerRadius(5)
                                .onTapGesture {
                                    withAnimation{
                                        show.toggle()
                                        number = "\(item)"
                                    }
                                }
                        }
                    }
                }
                .frame(width: 180, height: 30)
            }
        }
        .padding(5)
    }
}

struct Previews_AddView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
