//
//  ContentView.swift
//  Kadai7
//
//  Created by Hajime on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTag = 1
    
    var body: some View {
        TabView(selection: $selectedTag,
                content:  {
            AdditionCaluculatorView()
                .tabItem { Text("Item1") }.tag(1)
            SubstructionCaluculatorView()
                .tabItem { Text("Item2") }.tag(2)
        })
    }
}

struct AdditionCaluculatorView: View {
    enum Field: Hashable {
        case upper
        case lower
    }

    @State var upperNumber = ""
    @State var lowerNumber = ""
    @State var resultNumber = "Label"

    @FocusState var focus: Field?

    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            VStack {
                TextFieldCustom(number: $upperNumber)
                    .focused($focus, equals: Field.upper)
                TextFieldCustom(number: $lowerNumber)
                    .focused($focus, equals: Field.lower)
                Button("Button") {
                    resultNumber = String((Int(upperNumber) ?? 0) + (Int(lowerNumber) ?? 0))
                    focus = nil
                }
                Text("\(resultNumber)")
                Spacer()
            }
        }
    }
}

struct SubstructionCaluculatorView: View {
    enum Field: Hashable {
        case upper
        case lower
    }

    @State var upperNumber = ""
    @State var lowerNumber = ""
    @State var resultNumber = "Label"

    @FocusState var focus: Field?

    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
                TextFieldCustom(number: $upperNumber)
                    .focused($focus, equals: Field.upper)
                TextFieldCustom(number: $lowerNumber)
                    .focused($focus, equals: Field.lower)
                Button("Button") {
                    resultNumber = String((Int(upperNumber) ?? 0) - (Int(lowerNumber) ?? 0))
                    focus = nil
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
