//
//  Demographicview.swift
//  Cyder
//
//  Created by Prabhanshu Aggarwal on 2023-03-17.
//


import SwiftUI

enum DemographicData: String, CaseIterable, Identifiable {
    
    var id: Self {
        return self
    }
    
    case SecureBrowser = "First Nam", blockThirdPartyCookies = "Last Name",
         disableSandbox = "Disable Privacy Sandbox", doNotTrack = "Send 'Do Not Track' Request", disableAuditing = "Disable Hyperlink Auditing", disableReferrers = "Disable Referrers"
}




struct DemoographicView: View {
  @State var firstName = ""
  
    var body: some View {
        

        
        NavigationView {
            ScrollView(.vertical) {
                
                
                
                
                //                HStack {
                //                    Text("First Nam")
                //                        .font(.system(size: 16, design: .serif))
                //                        .padding()
                //                    TextField("", text: $firstName)
                //                }
                //
                VStack(alignment: .leading, spacing: 0) {
                    Text("User Demographics")
                    //  .padding()
                        .font(.system(size: 24,weight: .black, design: .serif))
                    Text("This is your personal demographics to undestand on which websites you are spending your most of the time.")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding(.bottom)
                    
                }
                
                ZStack {
                    
                    Image("i3")
                        .resizable()
                        .scaledToFit()
                    //.clipShape(Circle())
                    //.frame(width: 50, height: 150)
                        .background(
                            Image("i21")
                                .resizable()
                            // .clipShape(Rectangle())
                            //  .frame(width: 4050, height: 15000)
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                        )
                    
                    //                             Circle()
                    //                                 .fill(Color.secondary)
                    //                                 .frame(width: 150, height: 150)
                    
                    //                             Text("Your desired text")
                    //                                 .foregroundColor(.yellow)
                }
                
                Divider()
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Funny Meme")
                    
                        .font(.system(size: 24,weight: .black, design: .serif))
                    Text("Share this meme over social media to tell them how crazy you are. Only you have the capability to share.")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding(.bottom)
                    
                }
                ZStack {
                    
                    Image("i4")
                        .resizable()
                        .scaledToFit()
                    //.clipShape(Circle())
                    //.frame(width: 50, height: 150)
                        .background(
                            Image("i21")
                                .resizable()
                            // .clipShape(Rectangle())
                            //  .frame(width: 4050, height: 15000)
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                        )
                    
                    //                             Circle()
                    //                                 .fill(Color.secondary)
                    //                                 .frame(width: 150, height: 150)
                    
                    //                             Text("Your desired text")
                    //                                 .foregroundColor(.yellow)
                }
                
                HStack {
                    
                    Image("i5")
                        .resizable()
                        .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
//                        .background(
//                            Image("i21")
//                                .resizable()
//                             .clipShape(Rectangle())
//                              .frame(width: 40, height: 15000)
//                                .aspectRatio(contentMode: .fill)
//                                .edgesIgnoringSafeArea(.all)
//                        )
                    
//                                                 Circle()
//                                                     .fill(Color.secondary)
//                                                     .frame(width: 150, height: 150)
//
//                                                 Text("Your desired text")
//                                                     .foregroundColor(.yellow)
                    
                    Image("i6")
                        .resizable()
                        .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    
                    Image("i7")
                        .resizable()
                        .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    
//                    Image("i8")
//                        .resizable()
//                        .scaledToFit()
//                    .clipShape(Circle())
//                    .frame(width: 80, height: 80)
                    
                }
                
            }.padding()
            
            
            
        }
        
        
        
    }
}

struct DemoographicView_Previews: PreviewProvider {
    static var previews: some View {
        DemoographicView()
    }
}

