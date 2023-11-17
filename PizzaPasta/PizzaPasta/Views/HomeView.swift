//
//  HomeView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 15.11.23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var authenicationViewModel: AuthenticationViewModel
    
    let menuIcons = MenuIconEnum.allCases
    let role = "Zentrale"
    
    let red = Color(red: 0.887, green: -0.142, blue: 0.133)
    let yellow = Color(red: 1.023, green: 0.637, blue: -0.244)
    
    @State var buttonPressed = false
    @State var pizzaButtonPressed = false
    @State var pastaButtonPressed = false
    @State var saladButtonPressed = false
    @State var bowlButtonPressed = false
    @State var wrapsButtonPressed = false
    @State var fingerfoodButtonPressed = false
    @State var showSheet = false
    
    var body: some View {
        
        HStack {
            ZStack{
                HStack {
                    if pizzaButtonPressed{
                        LoginView()
                    } else if pastaButtonPressed{
                        Text("pasta")
                    }
                }.padding(.leading, 200)
                
                HStack {
                    ScrollView{
                        
                        //PIZZA
                        Button(action: {
                            setButtonColors(button: "pizza")
                        }, label: {
                            VStack {
                                Image(MenuIconEnum.pizza.menuIcons)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .background(pizzaButtonPressed ? yellow : red)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            }
                        })
                        
                        Text(MenuIconEnum.pizza.menuIcons)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        //PASTA
                        Button(action: {
                            setButtonColors(button: "pasta")
                        }, label: {
                            VStack {
                                Image(MenuIconEnum.pasta.menuIcons)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .background(pastaButtonPressed ? yellow : red)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            }
                        })
                        
                        Text(MenuIconEnum.pasta.menuIcons)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        //SALAD
                        Button(action: {
                            setButtonColors(button: "salat")
                        }, label: {
                            VStack {
                                Image(MenuIconEnum.salad.menuIcons)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .background(saladButtonPressed ? yellow : red)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            }
                        })
                        
                        Text(MenuIconEnum.salad.menuIcons)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        //BOWL
                        Button(action: {
                            setButtonColors(button: "bowl")
                        }, label: {
                            VStack {
                                Image(MenuIconEnum.bowl.menuIcons)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .background(bowlButtonPressed ? yellow : red)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            }
                        })
                        
                        Text(MenuIconEnum.bowl.menuIcons)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        //WRAPS
                        Button(action: {
                            setButtonColors(button: "wraps")
                        }, label: {
                            VStack {
                                Image(MenuIconEnum.wrap.menuIcons)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .background(wrapsButtonPressed ? yellow : red)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            }
                        })
                        
                        Text(MenuIconEnum.wrap.menuIcons)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        //FINGERFOOD
                        Button(action: {
                            setButtonColors(button: "fingerfood")
                        }, label: {
                            VStack {
                                Image(MenuIconEnum.fingefood.menuIcons)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .background(fingerfoodButtonPressed ? yellow : red)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            }
                        })
                        
                        Text(MenuIconEnum.fingefood.menuIcons)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        
                        //nur zum view testen -- auskommentierte funktion nutzen
                        //if authenicationViewModel.user?.role == "Zentrale"{
                        if role == "Zentrale"{
                            
                            Button(action: {
                                setButtonColors(button: "plus")
                                showSheet = true
                                
                            }, label: {
                                Image("plus")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .background(buttonPressed ? yellow : red)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            })
                            
                            
                        }
                    }
                    .frame(width: 200)
                    .background(Color(red: 0.49, green: 0.591, blue: 0.581))
                    .sheet(isPresented: $showSheet, content: AddRecipeSheet.init)
                    
                    
                    Spacer()
                }
            }
        }
        .scrollIndicators(.hidden)
    }
    
    private func setButtonColors(button: String){
        
        if button == "pizza"{
            pizzaButtonPressed = true
            pastaButtonPressed = false
            buttonPressed = false
            saladButtonPressed = false
            bowlButtonPressed = false
            wrapsButtonPressed = false
            fingerfoodButtonPressed = false
            
        } else if button == "pasta"{
            pizzaButtonPressed = false
            pastaButtonPressed = true
            buttonPressed = false
            saladButtonPressed = false
            bowlButtonPressed = false
            wrapsButtonPressed = false
            fingerfoodButtonPressed = false
            
        } else if button == "plus"{
            pizzaButtonPressed = false
            pastaButtonPressed = false
            buttonPressed = true
            saladButtonPressed = false
            bowlButtonPressed = false
            wrapsButtonPressed = false
            fingerfoodButtonPressed = false
            
        } else if button == "salat"{
            pizzaButtonPressed = false
            pastaButtonPressed = false
            buttonPressed = false
            saladButtonPressed = true
            bowlButtonPressed = false
            wrapsButtonPressed = false
            fingerfoodButtonPressed = false
            
        } else if button == "bowl"{
            pizzaButtonPressed = false
            pastaButtonPressed = false
            buttonPressed = false
            saladButtonPressed = false
            bowlButtonPressed = true
            wrapsButtonPressed = false
            fingerfoodButtonPressed = false
            
        } else if button == "wraps"{
            pizzaButtonPressed = false
            pastaButtonPressed = false
            buttonPressed = false
            saladButtonPressed = false
            bowlButtonPressed = false
            wrapsButtonPressed = true
            fingerfoodButtonPressed = false
            
        } else if button == "fingerfood"{
            pizzaButtonPressed = false
            pastaButtonPressed = false
            buttonPressed = false
            saladButtonPressed = false
            bowlButtonPressed = false
            wrapsButtonPressed = false
            fingerfoodButtonPressed = true
        }
        
    }
}

#Preview {
    HomeView()
}
