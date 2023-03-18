//
//  HomeView.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import SwiftUI
import CircularProgress



struct HomeView: View {
    @ObservedObject var user = User.shared
    @Binding var selection: Int
    @State var tokenProgress = 75.0
    @State var surveyOne = false
    @State var surveyTwo = false
    @State var surveyThree = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Cyder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .scaledToFit()
                
                VStack(alignment: .center) {
                    HStack {
                        Image("tokens")
                            .resizable()
                            .frame(width: 34, height: 34)
                        Text("**\(user.points)** Tokens Collected")
                            .font(.title)
                    }
                }
                Divider()
                VStack(alignment: .center) {
                    Text("**Featured Reward**")
                        .font(.title2)
                        .foregroundColor(.mainColor)

                    GiftView(company: Company(companyName: "Amazon", cardValue: 10, pointValue: 3000), giftType: .circular)
                    
                    Button(action: {
                        selection = 2
                    }, label: {
                        Text("View More")
                            .padding(7)
                            .background(Color.mainColor)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .trailing)

                    })

                    
                    
                }

                Divider()
                VStack(alignment: .center) {
                    Text("**Featured Task**")
                        .font(.title2)
                        .foregroundColor(.mainColor)

                    TaskView(task: FinancialTask(company: "Neo", description: "Sign Up For A Neo Financial Account", subDescription: "Sign Up For A Neo Financial Account", tokens: 10000))

                    
                    Button(action: {
                        selection = 1
                    }, label: {
                        Text("View More")
                            .padding(7)
                            .background(Color.mainColor)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .trailing)

                    })

                    
                    
                }
           
                Divider()
                VStack(alignment: .center) {
                    HStack {
                        Image("tracker")
                            .resizable()
                            .frame(width: 34, height: 34)

                        Text("**170** Trackers Blocked")
                            .font(.title)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .bottom])

                    HStack {
                        Image("ads")
                            .resizable()
                            .frame(width: 34, height: 34)

                        Text("**143** Ads Blocked")
                            .font(.title)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                
                
                Spacer()
            }
            .padding()
        }
        
    }
}
