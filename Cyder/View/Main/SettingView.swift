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
    
    case SecureBrowser = "Secure My Browser", blockThirdPartyCookies = "Block Third-Party Cookies",
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
    @State var doNotTrackDomains = ["localhost"]
    @State var blockCookies = ["drive.google.com", "www.dropbox.com"]
    @State var blockCookiesText = ""
    @State var doNotTrackText = ""
    
    @State var secureBrowserToggle = false
    @State var blockThirdPartyCookies = false
    @State var disableSandbox = false
    @State var doNotTrack = false
    @State var disableAuditing = false
    @State var disableReferrers = false
    @State var financialInstitutions = false
    @State var consumerBrands = false
    @State var healthcareProviders = false
    @State var technologyCompanies = false

    @State var newRewards = false
    @State var communityAnnouncements = false

    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Browser Settings")
                        .font(.headline)
                    Text("Choose which settings are used when 'Secure My Browser' is selected in the extension.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    ForEach(BrowserData.allCases) { browserSetting in
                        
                        switch browserSetting {
                        case .SecureBrowser:
                            Toggle(browserSetting.rawValue, isOn: $secureBrowserToggle)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)
                        case .blockThirdPartyCookies:
                            Toggle(browserSetting.rawValue, isOn: $blockThirdPartyCookies)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)
                        case .disableSandbox:
                            Toggle(browserSetting.rawValue, isOn: $disableSandbox)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)
                        case .doNotTrack:
                            Toggle(browserSetting.rawValue, isOn: $doNotTrack)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)
                        case .disableAuditing:
                            Toggle(browserSetting.rawValue, isOn: $disableAuditing)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)
                        case .disableReferrers:
                            Toggle(browserSetting.rawValue, isOn: $disableReferrers)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)
                        }
                        
                        
                    }
                        
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Data Ownership")
                        .font(.headline)
                    Text("Choose which types of organizations we share your data with. If all categories are disabled you will no longer be awarded tokens.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    ForEach(DataOwnership.allCases) { data in
                        
                        switch data {
                        case .ConsumerBrands:
                            Toggle(data.rawValue, isOn: $consumerBrands)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)
                        case .FinancialInstitutions:
                            Toggle(data.rawValue, isOn: $financialInstitutions)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)
                        case .HealthcareProviders:
                            Toggle(data.rawValue, isOn: $healthcareProviders)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)
                        case .TechnologyCompanies:
                            Toggle(data.rawValue, isOn: $technologyCompanies)
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 4)

                        }
                        
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Do Not Track")
                        .font(.headline)
                    Text("Cyder won't collect data from domains listed here. You also won't be able to earn any tokens while browsing on these sites.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    ForEach(doNotTrackDomains, id: \.self) { domain in
                        
                        HStack {
                            Text(domain)
                            Spacer()
                            Button(action: {
                                doNotTrackDomains.removeAll(where: {$0 == domain})
                            }, label: {
                                Image(systemName: "trash.fill")
                                    .tint(.red)
                            })
                        }
                        .padding()
                    }
                    
                    TextField("Enter a domain to stop collecting data from", text: $doNotTrackText)
                        .onSubmit {
                            doNotTrackDomains.append(doNotTrackText)
                            doNotTrackText = ""
                        }
                        .padding([.top, .bottom])
                        .textFieldStyle(.roundedBorder)
                                
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Allow Cookies")
                        .font(.headline)
                    Text("Some websites require third-party cookies. Add sites here to stop blocking cookies while 'Secure My Browser' is turned on.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    ForEach(blockCookies, id: \.self) { cookies in
                        
                        HStack {
                            Text(cookies)
                            Spacer()
                            Button(action: {
                                blockCookies.removeAll(where: {$0 == cookies})
                            }, label: {
                                Image(systemName: "trash.fill")
                                    .tint(.red)
                            })
                        }
                        .padding()
                    }
                    
                    TextField("Enter a domain on which to allow cookies", text: $blockCookiesText)
                        .onSubmit {
                            blockCookies.append(blockCookiesText)
                            blockCookiesText = ""
                        }
                        .padding([.top, .bottom])
                        .textFieldStyle(.roundedBorder)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Email Notifications")
                        .font(.headline)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Toggle("New Rewards / Products", isOn: $newRewards)
                            .padding([.leading, .trailing])
                            .padding([.top, .bottom], 4)
                        Toggle("Community Announcements", isOn: $communityAnnouncements)
                            .padding([.leading, .trailing])
                            .padding([.top, .bottom], 4)
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
