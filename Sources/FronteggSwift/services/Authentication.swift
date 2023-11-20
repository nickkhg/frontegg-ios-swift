//
//  FrontetggAuthentication.swift
//
//  Created by David Frontegg on 26/10/2022.
//

import AuthenticationServices
import UIKit
 

class WebAuthentication: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding {
    
    weak var window: UIWindow? = nil
    var ephemeralSesion: Bool = false
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {

        return  FronteggAuth.shared.getRootVC()?.view.window ?? ASPresentationAnchor()
    }
    override func responds(to aSelector: Selector!) -> Bool {
        return true
    }
    
    var webAuthSession: ASWebAuthenticationSession?
    
    
    func start(_ websiteURL:URL, completionHandler: @escaping ASWebAuthenticationSession.CompletionHandler) {
        
        let bundleIdentifier = try! PlistHelper.fronteggConfig().bundleIdentifier
        let webAuthSession = ASWebAuthenticationSession.init(
            url: websiteURL,
            callbackURLScheme: bundleIdentifier,
            completionHandler: completionHandler)
        // Run the session
        webAuthSession.presentationContextProvider = self
        webAuthSession.prefersEphemeralWebBrowserSession = self.ephemeralSesion
        

        self.webAuthSession = webAuthSession
        webAuthSession.start()

    }
}
