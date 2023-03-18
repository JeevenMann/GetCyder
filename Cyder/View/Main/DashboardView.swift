//
//  DashboardView.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import SwiftUI

struct FinancialTask: Hashable, Identifiable {
    var id = UUID()
    
    var company: String
    var description: String
    var subDescription: String
    var tokens: Int
}

struct DashboardView: View {
    

    
    
    @State var companies = [
        FinancialTask(company: "profile", description: "Complete your profile", subDescription: "Complete your profile", tokens: 800),

        FinancialTask(company: "tutorial", description: "Complete tutorial", subDescription: "Complete tutorial", tokens: 800),

        FinancialTask(company: "TD", description: "TD Canada Trust Survey", subDescription: "Take a quick survey from TD Canada Trust", tokens: 5000),
        
        FinancialTask(company: "RBC", description: "RBC Survey", subDescription: "Take a quick survey from RBC", tokens: 5000)
        
   

    ]
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Text("**Featured Task**")
                    .font(.title2)
                    .foregroundColor(.mainColor)
                
                
                TaskView(task: FinancialTask(company: "Neo", description: "Sign Up For A Neo Financial Account", subDescription: "Sign Up For A Neo Financial Account", tokens: 10000))

                
               
                Text("**All Tasks**")
                    .font(.title)
                    .foregroundColor(.mainColor)
            
                List(companies) { company in
                    TaskView(task: company)
                }
                .listStyle(.plain)
                
                
            }
            
        }
        .padding()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
