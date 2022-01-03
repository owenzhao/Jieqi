//
//  ContentView.swift
//  Jieqi
//
//  Created by zhaoxin on 2021/12/18.
//

import SwiftUI
import Chinese24Jieqi

struct ContentView: View {
    @State var date:Date = {
        var cps = DateComponents()
        cps.year = 2022
        cps.month = 1
        cps.day = 4
        
        let date = Calendar(identifier: .gregorian).date(from: cps)!
        
        return date
    }()
    
    var body: some View {
        VStack {
            Text(getDate())
            Text(getJieqi())
            Text(getSeason())
        }.padding()
    }
    
    private func getDate() -> String {
        return DateFormatter.localizedString(from: date, dateStyle: .full, timeStyle: .none)
    }
    
    private func getJieqi() -> String {
        return Jieqi().at(date)
    }
    
    private func getSeason() -> String {
        return Jieqi().whichSeason(at: date).localizedString
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
