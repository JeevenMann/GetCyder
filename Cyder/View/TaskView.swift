//
//  TaskView.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import SwiftUI

struct TaskView: View {
    
    var task: FinancialTask
    var body: some View {
        HStack {
            if task.company == "tutorial"  {
                Image(systemName: "arrow.up.right.and.arrow.down.left.rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else if task.company == "profile" {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else {
                Image(task.company)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
            }
            VStack(alignment: .leading) {
                Text("**\(task.description)**")
                    .fixedSize(horizontal: false, vertical: true)

                Text("\(task.subDescription) and earn **\(task.tokens) Tokens!**")
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
            Image(systemName: "chevron.forward")
                .imageScale(.medium)
        }
    }
}
