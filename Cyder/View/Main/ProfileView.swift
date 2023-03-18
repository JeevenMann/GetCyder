//
//  SettingView.swift
//  Cyder
//
//  Created by Prabhanshu Aggarwal on 2023-03-17.
//

import SwiftUI
struct ProfileView: View {
  @State var firstName = ""
    @State var isOn: Bool = true
    @State private var selection = "Red"
        let Gender1 = ["Male", "Female", "Don't Prefer to say"]
    
    let Gender: [String] = ["Male", "Female", "Don't Prefer to say"]
    let Status: [String] = ["Student", "Employed", "Un-Employed"]
    let Maritalstatus: [String] = ["Single", "Married","Widowed", "Prefer Not to Say"]
        
     
    var body: some View {
     
             
        NavigationView {
            ScrollView(.vertical) {
                
           
                
                ZStack {
                            
                    Image("prof")
                        .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
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
                
                     
                VStack(alignment: .leading, spacing: 0) {
                    Text("Profile View")
                        .font(.system(size: 24,weight: .black, design: .serif))
                    Text("This is your personal profile which is visisble to you only.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    
                    
                    
                    HStack {
                        
                        Text("First Name")
                            .font(.system(size: 16, design: .serif))
                            .padding()
                        Text("  Charlie                                          ")
                           
                            .font(.system(size: 16,weight: .light, design: .serif))
                            .background(Rectangle().stroke())
                      
                    }
                    
                    HStack {
                        
                        Text("Last Name ")
                            .font(.system(size: 16, design: .serif))
                            .padding()
                        Text("  Mike                                              ")
                            .font(.system(size: 16,weight: .light, design: .serif))
                            .background(Rectangle().stroke())
                        
                    }
                    
                    HStack {
                        
                        Text("Email          ")
                            .font(.system(size: 16, design: .serif))
                            .padding()
                        Text("  abc@gmail.com                             ")
                            .font(.system(size: 15,weight: .light, design: .serif))
                            .background(Rectangle().stroke())
                            
                    }
                    HStack {
                        
                        Text("Mobile No.")
                            .font(.system(size: 16, design: .serif))
                            .padding()
                        Text("  +19378765354                              ")
                            .background(Rectangle().stroke())
                            .font(.system(size: 16,weight: .light, design: .serif))
                      
                    }
                    
                    
                    HStack {
                        
                        Text("Province    ")
                            .font(.system(size: 16, design: .serif))
                            .padding()
                        Text("  ON                                                  ")
                            .background(Rectangle().stroke())
                            .font(.system(size: 16,weight: .light, design: .serif))
                      
                    }
                    
                    
                    
                    
                    HStack {
                        
                        Text("City             ")
                            .font(.system(size: 16, design: .serif))
                            .padding()
                        Text("  London                                         ")
                            .font(.system(size: 16,weight: .light, design: .serif))
                            .background(Rectangle().stroke())
                       
                    }
                }
//                HStack {
//
//                    .dropdown-text {
//                        Text("City             ")
//                    color: gray;
//                    }
//                }
                
              
                
                
            
                
                   GroupBox(){
                            DisclosureGroup("Gender") {
                                ForEach(0..<Gender.count, id: \.self){ index in
                                    Divider()
                                        .padding(.vertical, 2)
                                    
                                    HStack{
                                        Group{
                                            
                                            Text(Gender[index])
                                        }//: GROUP
                                        .foregroundColor(.gray)
                                        .font(.system(.body).bold())
//                                        .dropdown-text {
                                        
//                                        }
                                        Spacer(minLength: 25)
                                        
                                    }//: HSTACK
                                }//: LOOP
                            }//: DISCLOSURE
                        }//: BOX
                
                GroupBox(){
                         DisclosureGroup("Working Status") {
                             ForEach(0..<Status.count, id: \.self){ index in
                                 Divider()
                                     .padding(.vertical, 2)
                                 
                                 HStack{
                                     Group{
                                         
                                         Text(Status[index])
                                     }//: GROUP
                                     .foregroundColor(.gray)
                                     .font(.system(.body).bold())
                                     
                                     Spacer(minLength: 25)
                                     
                                 }//: HSTACK
                             }//: LOOP
                         }//: DISCLOSURE
                     }//: BOX
                
                GroupBox(){
                         DisclosureGroup("Marital Status") {
                             ForEach(0..<Status.count, id: \.self){ index in
                                 Divider()
                                     .padding(.vertical, 2)
                                 
                                 HStack{
                                     Group{
                                         
                                         Text(Status[index])
                                     }//: GROUP
                                     .foregroundColor(.gray)
                                     .font(.system(.body).bold())
                                     
                                     Spacer(minLength: 25)
                                     
                                 }//: HSTACK
                             }//: LOOP
                         }//: DISCLOSURE
                     }//: BOX
                
                
              
                
                
                
                
            }
            .padding()
            
        }
        .navigationTitle("Control Your Data")
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
