//
//  TrackerView.swift
//  caloriesApp
//
//  Created by Danca Nguyen on 12/6/23.
//

import SwiftUI

struct TrackerView: View {
    @EnvironmentObject var vm:cddatamodel
    @State var itemselected:Tab = .Breakfast
    @State var show = false
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Hello User").bold()
                        .font(.system(size: 35))
                    Spacer()
                    Image("Bur")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .shadow(color: .blue, radius: 20, x: 0, y: 0)
                        .clipShape(Circle())
                    
                }
                .padding(.horizontal)
                RingView()
           
                TabView(itemselected: $itemselected)
                if itemselected  == .Breakfast{
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(vm.saveBreakfastEntity){ item in
                                FoodCard(width: 200, carbs: CGFloat(item.carbs), protein:  CGFloat(item.carbs), fat:  CGFloat(item.carbs), name: item.name ?? "", title: item.ingredients ?? "", icon: item.icon ?? "")
                                    .padding(.leading)
                                    .overlay(alignment: .topTrailing, content: {
                                        Button(action: {
                                            vm.addValue(fat: CGFloat(item.fat), protein: CGFloat(item.protein), carbs: CGFloat(item.carbs))
                                            vm.addmealTaggle(meal: item)
                                            vm.Addringcarlories(calories: CGFloat(item.carbs))
                                        }, label: {
                                            ZStack{
                                                Circle()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(.white)
                                                Image(systemName: item.addmeal ? "checkmark" : "plus")
                                                    .imageScale(.small)
                                                    .foregroundColor(.black)
                                            }
                                            .modifier(customShadow())
                                        })
                                        .offset(x:-5,y:5)
                                    })
                            }

                        }
                        .frame(height: 180)
                    }
                    .offset(y: -25)
                }else if itemselected == .Lunch{
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(vm.saveLunchEntity){ item in
                                FoodCard(width: 200, carbs: CGFloat(item.carbs), protein:  CGFloat(item.protein), fat:  CGFloat(item.fat), name: item.name ?? "", title: item.ingredients ?? "", icon: item.icon  ?? "")
                                    .padding(.leading)

                            }
                        }
                        .frame(height: 180)
                    }
                    .offset(y: -25)

                }
//                List{
//                    ForEach(vm.saveBreakfastEntity){ item in
//                        FoodCard(width: 200, cards: CGFloat(item.cards), protein:  CGFloat(item.cards), fat:  CGFloat(item.cards), name: item.name ?? "", titel: item.ingredients ?? "", icon: item.icon ?? "")
//                            .padding(.leading)
//                            .overlay(alignment: .topTrailing, content: {
//                                Button(action: {
//                                    vm.addValue(fat: CGFloat(item.fat), protein: CGFloat(item.protein), cards: CGFloat(item.cards))
//                                    vm.addmealTaggle(meal: item)
//                                    vm.Addringcarlories(calories: CGFloat(item.cards))
//                                }, label: {
//                                    ZStack{
//                                        Circle()
//                                            .frame(width: 30, height: 30)
//                                            .foregroundColor(.white)
//                                        Image(systemName: item.addmale ? "checkmark" : "plus")
//                                            .imageScale(.small)
//                                            .foregroundColor(.black)
//                                    }
//                                    .modifier(customShadow())
//                                })
//                                .offset(x:-5,y:5)
//                            })
//                    }
//                    .onDelete(perform: vm.deletone)
//                }
                waterView()
                    .offset(y: -50)
                Spacer()
                    .overlay(alignment: .bottomLeading, content: {
                        Button(action: {
                            show.toggle()
                        }, label: {
                            Text("New Meal").bold()
                                .foregroundColor(.black)
                                .frame(width: 150, height: 50)
                                .background(.white)
                                .clipShape(Capsule())
                                .modifier(customShadow())
                        })
                        .padding()
                    })
                    .sheet(isPresented: $show, content: {
                        AddView()
                    })
//                Button(action: {
//                    vm.resetValues()
//                }, label: {
//                    Text("dd")
//                })
                
            }
        }
    
    
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
            .environmentObject(cddatamodel())
    }
}

