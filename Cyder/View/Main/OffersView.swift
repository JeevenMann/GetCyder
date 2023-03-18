//
//  OffersView.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import SwiftUI
import CircularProgress
struct OffersView: View {
    @ObservedObject var user = User.shared

    @State var companies = [
        Company(companyName: "Airmiles", cardValue: 10, pointValue: 1000),
        Company(companyName: "Scene", cardValue: 10, pointValue: 1000),

        Company(companyName: "Joe's Coffee", cardValue: 5, pointValue: 1000),
        Company(companyName: "Gymshark", cardValue: 5, pointValue: 1000),
        Company(companyName: "Apple", cardValue: 5, pointValue: 1000),
        Company(companyName: "Amazon", cardValue: 5, pointValue: 1000),
        Company(companyName: "Starbucks", cardValue: 5, pointValue: 1000),
        Company(companyName: "Chipotle", cardValue: 5, pointValue: 1000),
        Company(companyName: "Gymshark", cardValue: 10, pointValue: 3000),
        Company(companyName: "Apple", cardValue: 10, pointValue: 3000),
        Company(companyName: "Amazon", cardValue: 10, pointValue: 3000),
        Company(companyName: "Starbucks", cardValue: 10, pointValue: 3000),
        Company(companyName: "Chipotle", cardValue: 10, pointValue: 3000),
        Company(companyName: "Apple", cardValue: 50, pointValue: 10000),
        Company(companyName: "Amazon", cardValue: 50, pointValue: 10000),
        Company(companyName: "Starbucks", cardValue: 50, pointValue: 10000),
        Company(companyName: "Chipotle", cardValue: 50, pointValue: 10000),
    ]

    
    var body: some View {
        VStack {
            HStack {
                Image("tokens")
                    .resizable()
                    .frame(width: 34, height: 34)
                Text("**\(user.points)** Tokens Collected")
                    .font(.title)
            }
            
            
            Divider()
            VStack(alignment: .center) {
                Text("**Featured Reward**")
                    .font(.title2)
                    .foregroundColor(.mainColor)
                
                GiftView(company: Company(companyName: "Amazon", cardValue: 10, pointValue: 3000), giftType: .circular)
                Divider()
            }
            
                Text("**All Rewards**")
                    .font(.title)
                    .foregroundColor(.mainColor)
            
          
            
            List(companies, id: \.self) { company in
                if company.companyName == "Airmiles" || company.companyName == "Scene" {
                    GiftView(company: company, giftType: .convert)
                } else {
                    GiftView(company: company)
                }
            }
            .listRowInsets(.none)
            .listStyle(.plain)
            
            
                
                
            }
        .padding()
        }
    }



struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView()
    }
}
