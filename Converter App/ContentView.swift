//
//  ContentView.swift
//  Converter App
//
//  Created by Soumyattam Dey on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input_unit=0
    @State private var output_unit=0
    @State private var input_value=""
    
    
    let temperature_units=["Celcius","Kelvin","Fahrenheit"]
    let temperature_symbols=["°C","K","°F"]
    
    var convertedValue:Double{
        let inputValue=Double(input_value) ?? 0
        let inputUnit=temperature_units[input_unit]
        let outputUnit=temperature_units[output_unit]
        
        var base_converted_value:Double=0
        var converted_value:Double=0
        
        if(inputUnit=="Kelvin"){
            base_converted_value=inputValue-273.15
        }else if(inputUnit=="Fahrenheit"){
            base_converted_value=(inputValue-32)*(5/9)
        }else{
            base_converted_value=inputValue
        }
        
        if(outputUnit=="Kelvin"){
            converted_value=base_converted_value+273.15
        }else if(outputUnit=="Fahrenheit"){
            converted_value=(base_converted_value*9)/5+32
        }else{
            converted_value=base_converted_value
        }
        
        return converted_value
    }
    
    var body: some View {
        NavigationView{
            Form{
                
                Section(header:Text("Select input unit :")){
                    Picker("Select the input unit",selection: $input_unit){
                        ForEach(0..<temperature_units.count){
                            Text(temperature_units[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header:Text("Select output unit :")){
                    Picker("Select the output unit",selection: $output_unit){
                        ForEach(0..<temperature_units.count){
                            Text(temperature_units[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("Input value:(in \(temperature_symbols[input_unit]))")){
                    TextField("Enter \(temperature_units[input_unit]) value",text: $input_value)
                        .keyboardType(.decimalPad)
                }
                
                Section(header:Text("Converted Value:")){
                    Text(" \(convertedValue,specifier: "%.2f") \(temperature_symbols[output_unit]) ")
                }
                
            }
            .navigationBarTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
