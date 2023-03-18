//
//  GiftView.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import SwiftUI
import CircularProgress
enum GiftType {
    case circular, button, convert
}
struct GiftView: View {
    @ObservedObject var user = User.shared
    @State var showSheet = false
    var company: Company
    var giftType: GiftType = .button
    var body: some View {
        HStack {
            Image(company.companyName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
                .scaledToFit()
                .cornerRadius(10)
                .fixedSize(horizontal: true, vertical: true)
            Spacer()
            VStack(alignment: .trailing) {
                if company.companyName == "Joe's Coffee" {
                    Text("**Free medium coffee from Joe's Coffee**")
                        .font(.subheadline)
                } else if giftType == .convert && company.companyName == "Airmiles" {
                    Text("**Convert 1000 Points into 100 Airmiles**")
                } else if giftType == .convert && company.companyName == "Scene" {
                    Text("**Convert 1000 Points into 100 Scene Points**")
                } else {
                    Text("**$\(company.cardValue) \(company.companyName) Gift Card**")
                        .font(.subheadline)
                }
                HStack {
                    if user.points > company.pointValue {
                        Spacer()
                        Button(action: {
                            user.points -= company.pointValue
                            showSheet.toggle()
                        }, label: {
                            Text("Redeem for \(company.pointValue)")
                                .padding([.top,.bottom], 3)
                                .padding([.leading,.trailing], 6)
                                .foregroundColor(.white)
                                .background(Color.mainColor)
                                .cornerRadius(7)
                        })
                    
                    } else if giftType == .circular {
                        CircularProgressView(count: user.points, total: company.pointValue, progress: Double(user.points) / Double(company.pointValue), lineWidth: 5, showText: false)
                            .frame(width: 30, height: 30)
                        Text("**\(user.points) / \(company.pointValue)** Points")
                    } else {
                        Spacer()
                        Button(action: {
          
                        }, label: {
                            Text("Redeem for \(company.pointValue)")
                                .padding([.top,.bottom], 3)
                                .padding([.leading,.trailing], 6)
                                .foregroundColor(.white)
                                .background(.gray)
                                .cornerRadius(7)
                        })
                    
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet, content: {
            VStack {
                if giftType == .convert {
                    Text("**Congratulations!** Please check your email for next steps. Share your reward with your friends!")
                    
                    if company.companyName == "Airmiles" {
                        
                        ShareLink(item: "I just got 100 Airmile points by stealing my data back! You can too by downloading the cyder app and claiming your first reward. https://www.getcyder.com", label: {
                            Text("Share (+**100** tokens)")
                                .padding()
                                .background(Color.mainColor)
                                .cornerRadius(10)
                        })
                        .tint(.white)
                    } else if company.companyName == "Scene" {
                        ShareLink(item: "I just got 100 Scene points by stealing my data back! You can too by downloading the cyder app and claiming your first reward. https://www.getcyder.com", label: {
                            Text("Share (+**100** tokens)")
                                .padding()
                                .background(Color.mainColor)
                                .cornerRadius(10)
                        })
                        .tint(.white)
                    }
                } else {
                    Text("**Congratulations!** Please check your email for your giftcard. Share your reward with your friends!")
                    
                    ShareLink(item: "I just earned a $\(company.cardValue) \(company.companyName) gift card by stealing my data back! You can too by downloading the cyder app and claiming your first reward. https://www.getcyder.com", label: {
                        Text("Share (+**100** tokens)")
                            .padding()
                            .background(Color.mainColor)
                            .cornerRadius(10)
                    })
                    .tint(.white)
                }
                
            }
            .padding()
            .presentationDetents([.fraction(0.25)])
            
            
            
        })
    }
}

