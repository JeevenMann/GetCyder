//
//  SettingView.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import SwiftUI

enum BrowserData: String, CaseIterable, Identifiable {
    
    var id: Self {
        return self
    }
    
    case SecureBrowser = "Secure My Browser", blockThirdPartyCookkies = "Block Third-Party Cookies",
    disableSandbox = "Disable Privacy Sandbox", doNotTrack = "Send 'Do Not Track' Request", disableAuditing = "Disable Hyperlink Auditing", disableReferrers = "Disable Referrers"
}

enum DataOwnership: String, CaseIterable, Identifiable {
    
    var id: Self {
        return self
    }

    case FinancialInstitutions = "Financial Institutions", ConsumerBrands = "Consumer Brands",
    HealthcareProviders = "Healthcare Providers", TechnologyCompanies = "Technology Companies"
}


struct SettingView: View {
    
    @State var isOn = false
    var body: some View {

        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Browser Settings")
                        .font(.headline)
                    Text("Choose which settings are used when 'Secure My Browser' is selected in the extension.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    ForEach(BrowserData.allCases) { browserSetting in
                        Toggle(browserSetting.rawValue, isOn: $isOn)
                            .padding([.leading, .trailing])
                            .padding([.top, .bottom], 3)
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Data Ownership")
                        .font(.headline)
                    Text("Choose which types of organizations we share your data with. If all categories are disabled you will no longer be awarded tokens.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    ForEach(DataOwnership.allCases) { data in
                        Toggle(data.rawValue, isOn: $isOn)
                            .padding([.leading, .trailing])
                            .padding([.top, .bottom], 3)
                    }
                    
                }
                
                
                
                
                
                
                
            }
            .padding()
            
        }
        .navigationTitle("Control Your Data")


    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
