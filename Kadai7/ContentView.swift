//
//  ContentView.swift
//  Kadai7
//
//  Created by Hajime on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    @State var upperNumber1 = ""
    @State var lowerNumber1 = ""
    @State var resultNumber1 = "Label"
    @State var upperNumber2 = ""
    @State var lowerNumber2 = ""
    @State var resultNumber2 = "Label"
    @State var selectedTag = 1
    init() {
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView(selection: $selectedTag,
                content:  {
            AdditionCaluculatorView(upperNumber: $upperNumber1, lowerNumber: $lowerNumber1, resultNumber: $resultNumber1)
                .tabItem { Text("Item1") }.tag(1)
            SubstructionCaluculatorView(upperNumber: $upperNumber2, lowerNumber: $lowerNumber2, resultNumber: $resultNumber2)
                .tabItem { Text("Item2") }.tag(2)
        })
    }
}

struct AdditionCaluculatorView: View {
    @Binding var upperNumber: String
    @Binding var lowerNumber: String
    @Binding var resultNumber: String
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            VStack {
                TextFieldCustom(number: $upperNumber)
                TextFieldCustom(number: $lowerNumber)
                Button("Button") {
                    resultNumber = String((Int(upperNumber) ?? 0) + (Int(lowerNumber) ?? 0))
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                Text("\(resultNumber)")
                Spacer()
            }
        }
    }
}

struct SubstructionCaluculatorView: View {
    @Binding var upperNumber: String
    @Binding var lowerNumber: String
    @Binding var resultNumber: String
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
                TextFieldCustom(number: $upperNumber)
                TextFieldCustom(number: $lowerNumber)
                Button("Button") {
                    resultNumber = String((Int(upperNumber) ?? 0) - (Int(lowerNumber) ?? 0))
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                Text("\(resultNumber)")
                Spacer()
            }
        }
    }
}

struct TextFieldCustom: View {
    @Binding var number: String
    var body: some View {
        TextField("", text: $number)
            .textFieldStyle(.roundedBorder)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .keyboardType(.numberPad)
            .padding(5)
    }
}

#Preview {
    ContentView()
}
