//
//  ContentView.swift
//  Calculater
//
//  Created by Amani Al Osaimi on 04/08/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
    @State var result = "0"
    @State var x = 0
    @State var y = 0
    @State var opr = ""
    
    var body: some View {
        
        ZStack{
            
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("\(result)")
                    .font(.system(size: 70,weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 100 ,height: 100)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .padding(.bottom, 120)
            
            VStack{
                
                HStack{
                    circleOper(number:"C",v: self)
                    circleOper(number:"*",v: self)
                    circleOper(number:"/", v: self)
                    circleOper(number:"-", v: self)
                    
                }
                HStack{
                    circleNumbers(number:7,v: self)
                    circleNumbers(number:8,v: self)
                    circleNumbers(number:9, v: self)
                    circleOper(number:"+", v: self)
                    
                    
                }
                HStack{
                    circleNumbers(number:4,v: self)
                    circleNumbers(number:5,v: self)
                    circleNumbers(number:6, v: self)
                    circleEqual(number:"=", v: self)
                    
                    
                }
                HStack{
                    circleNumbers(number:1,v: self)
                    circleNumbers(number:2,v: self)
                    circleNumbers(number:3, v: self)
                    circleZero(number:0, v: self)
                    
                    
                }
            }
            .padding(.top, 350)

            
            
            
        }}
      
 
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct circleNumbers: View {
    var number : Int
    var v : ContentView

    var body: some View {

        Button(action: {
                    print(number)
            print(v.result)
            
            if v.opr == ""{
                if v.result == "0"{
                    v.x = number
                    v.result = String(number)
                    print(v.result)
                    print(v.x)
                }
                else{
                    v.x = number
                    v.result =  v.result+String(number)
                    print(v.result)
                    print(v.x)
                }
               
            }
            else {
                if v.y == 0{
                    v.y = number
                    v.result = String(number)
                }
                else{
                    v.y = number
                    v.result = v.result+String(number)
                }
                
            }
           
                    }) {
                    Text("\(number)")
                        .frame(width: 90, height: 90)
                        .foregroundColor(Color.black)
                        .background(Color.gray)
                        .clipShape(Circle())
                }

    
    }}
struct circleOper: View {
    var number : String
    var v : ContentView

    var body: some View {

        Button(action: {
            print(number)
            print(v.result)
            if number == "C"{
                v.result = "0"
                v.x = 0
                v.y = 0
                v.opr = ""
            }
            
            else if v.opr != "="{
                v.x = Int(v.result) ??  0
                v.opr = number
                print(v.opr)

            }
          
                    }) {
                    Text("\(number)")
                        .frame(width: 90, height: 90)
                        .foregroundColor(Color.black)
                        .background(Color.orange)
                        .clipShape(Circle())
                }

    
    }}

struct circleEqual: View {
    var number : String
    var v : ContentView

    var body: some View {

        Button(action: {
            print(number)
            print(v.result)
            v.y = Int(v.result) ?? 0
            switch(v.opr){
            case "+":
                print(v.x)
                print(v.y)
                print(v.x+v.y)
                v.result = String(v.x + v.y)
                break
            case "-":
                print(v.x)
                print(v.y)
                print(v.x-v.y)
                v.result = String(v.x - v.y)
                break
            case "*":
                print(v.x)
                print(v.y)
                print(v.x*v.y)
                v.result = String(v.x * v.y)
                break
            case "/":
                print(v.x)
                print(v.y)
                print(v.x/v.y)
                v.result = String(v.x / v.y)
                break

            default:
                v.result = v.result
            }
          
                    }) {
                    Text("\(number)")
                        .frame(width: 90, height: 90)
                        .foregroundColor(Color.black)
                        .background(Color.orange)
                        .clipShape(Circle())
                }

    
    }}
struct circleZero: View {
    var number : Int
    var v : ContentView

    var body: some View {

        Button(action: {
            print(number)
            print(v.result)
            if v.opr == ""{
                v.result = v.result + String(number)
            }
          
                    }) {
                    Text("\(number)")
                        .frame(width: 90, height: 90)
                        .foregroundColor(Color.black)
                        .background(Color.orange)
                        .clipShape(Circle())
                }

    
    }}
