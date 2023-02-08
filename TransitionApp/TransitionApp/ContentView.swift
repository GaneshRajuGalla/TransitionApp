//
//  ContentView.swift
//  TransitionApp
//
//  Created by Ganesh Raju Galla on 08/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSelected:Bool = false
    var body: some View {
        ZStack{
            VStack{
                appBarView()
                cardView()
                refreshView()
                allTransactionView()
                ScrollView{
                    ForEach(0..<10){ index in
                        TransactionView()
                            .onTapGesture {
                                withAnimation(.spring(response: 0.9,dampingFraction: 0.4,blendDuration: 1)) {
                                    isSelected.toggle()
                                }
                            }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(.brown.opacity(0.6))
    }
}


extension ContentView{
    
    private func appBarView() -> some View{
        HStack{
            Image(systemName: "star.fill")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 40,height: 40)
            Spacer()
            ZStack{
                Text("Add Card")
                    .font(.headline)
                    .padding()
                    .bold()
                    .foregroundColor(.white)
            }
            .background(Color.black)
            .cornerRadius(20)
            .padding()
        }
        .padding(.leading,20)
    }
    
    private func refreshView() -> some View{
        ZStack{
            VStack{
                HStack{
                    Text("Refer a friend and get \n $15 on your account")
                        .font(.title3)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer()
                    HStack{
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .frame(width: 40,height: 40)
                    .background(Color.black)
                    .cornerRadius(50)
                }
                .padding(.top,20)
                .padding(.horizontal,30)
                Spacer()
                HStack{
                    ForEach(0..<5){ image in
                        HStack{
                            Image("Ganesh")
                                .resizable()
                        }
                        .frame(width: 50,height: 50)
                        .cornerRadius(100)
                    }
                }
                .padding(.bottom,20)
            }
        }
        .frame(width: 350,height: 160)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.top,15)
        .padding(.bottom,10)
    }
    
    private func allTransactionView() -> some View{
        HStack{
            Text("Transaction")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Spacer()
            Text("View All")
                .foregroundColor(.black.opacity(0.5))
                .font(.body)
        }
        .padding(.horizontal,25)
        .padding(.bottom,10)
    }
}

struct cardView: View{
    @State private var isView:Bool = false
    var body: some View{
        ZStack{
            VStack(alignment: .leading) {
                HStack{
                    Text("Available Balance")
                        .foregroundColor(.white.opacity(0.5))
                    Spacer()
                    Circle()
                        .strokeBorder(.black,lineWidth: 1)
                        .background(Circle().foregroundColor(.white.opacity(0.5)))
                        .frame(width: 40,height: 40)
                        
                    Circle()
                        .strokeBorder(.black,lineWidth: 1)
                        .background(Circle().foregroundColor(.white.opacity(0.5)))
                        .frame(width: 40,height: 40)
                        .offset(x:-30)
                }
                .padding(.leading,20)
                .onTapGesture {
                    withAnimation(.spring(response: 0.9,dampingFraction: 0.4,blendDuration: 1)){
                        isView.toggle()
                    }
                }
                Text("$30,000")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .scaleEffect(isView ? 1.5 : 1)
                    .padding(.horizontal,isView ? 40:20)
                
                HStack(alignment: .center) {
                    if isView{
                        HStack{
                            Image("Ganesh")
                                .resizable()
                        }
                        .frame(width: 50,height: 50)
                        .cornerRadius(100)
                    }
                    ExtractView(icon: "plus", title: "Add")
                        .offset(x: isView ? 40 : 0)
                    Spacer()
                    ExtractView(icon: "arrow.up.forward", title: "Send")
                        .offset(x: isView ? 90 : 0 , y: isView ? -80 : 0)
                    Spacer()
                    ExtractView(icon: "tablecells.fill.badge.ellipsis", title: "More")
                }
                .padding([.top,.horizontal],20)
            }
        }
        .frame(width: 350,height: 250)
        .background(isView ? .black : .black.opacity(0.9))
        .cornerRadius(20)
        .rotation3DEffect(.degrees(isView ? 10 : 0), axis: (x: 0, y: 1, z: 0))
    }
}

struct ExtractView: View{
    @State var icon:String
    @State var title:String
    var body: some View{
        VStack{
            HStack{
                Image(systemName: icon)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .frame(width: 80,height: 45)
            .background(.white)
            .cornerRadius(30)
            .padding(.bottom,0)
            
            Text(title)
                .foregroundColor(.white.opacity(0.5))
                .padding(.bottom,5)
        }
    }
}

struct TransactionView: View{
    @State var isZoom:Bool = false
    var body: some View{
        HStack{
            HStack{
                Image("eth")
                    .resizable()
                    .frame(height: 25)
                    .scaledToFit()
            }
            .frame(width: 50,height: 50)
            .background(.white)
            .cornerRadius(50)
            VStack(alignment: .leading) {
                Text("Ganesh Raju")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("08 Feb,2023")
                    .foregroundColor(.black.opacity(0.5))
                    .font(.footnote)
            }
            Spacer()
            Text("+ $542,40")
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.horizontal,isZoom ? 40 : 30)
        .frame(height: 50)
        .padding(.vertical,10)
        .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 20,style: .continuous))
        .rotation3DEffect(.degrees(isZoom ? 10:0), axis: (x: 0, y: 1, z: 0))
        .scaleEffect(1)
        .onTapGesture {
            withAnimation(.spring(response: 0.6,dampingFraction: 0.3,blendDuration: 1)) {
                isZoom.toggle()
            }
        }
    }
}
