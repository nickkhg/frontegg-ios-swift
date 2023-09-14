//
//  EmbeddedLoginPage.swift
//  
//
//  Created by David Frontegg on 13/09/2023.
//

import Foundation
import SwiftUI

public struct EmbeddedLoginPage: View {
    var fronteggAuth: FronteggAuth
    
    public init(){
        self.fronteggAuth = FronteggAuth.shared
    }
    public var body: some View {
        ZStack {
            NavigationView{
                VStack(alignment: .center) {
                   FronteggWebView()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Back to login") {
                            fronteggAuth.accessToken = nil
                            fronteggAuth.refreshToken = nil
                            fronteggAuth.user = nil
                            fronteggAuth.isAuthenticated = false
                            fronteggAuth.isLoading = true
                            fronteggAuth.initializing = true
                            fronteggAuth.pendingAppLink = nil
                            fronteggAuth.appLink = false
                            fronteggAuth.externalLink = false
                            fronteggAuth.logout()
                        }
                    }
                }
                .navigationBarHidden(!fronteggAuth.externalLink)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)

                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

                .ignoresSafeArea(fronteggAuth.externalLink ? [] : [.all])

            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .ignoresSafeArea()
        
    }
}

struct FronteggLoginPage_Previews: PreviewProvider {
    static var previews: some View {
        EmbeddedLoginPage()
    }
}
