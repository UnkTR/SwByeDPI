//
//  ContentView.swift
//  ByeDPI-iOS
//
//  Created by developer on 24.02.2026.
//

import SwiftUI
import SwByeDPI

struct HomeScreen: View {
    
    @EnvironmentObject fileprivate var properties: AppProperties
    @EnvironmentObject fileprivate var lnwPermissionManager: LNWPermissionManager
    
    @State var proxyStartFailErrorText = ""
    @State var vpnEnabled = false
    @State var showProxyEnabledHintAlert = false
    @State var showProxyStartErrorAlert = false
    
    fileprivate var byeDPIProxyAddr: String {
        get {
            return properties.byeDPILaunchConfig.listenIP + ":" + String(properties.byeDPILaunchConfig.listenPort)
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 8.0) {
            Spacer(minLength: 16)
            Button {
                toggleVpn()
            } label: {
                Image(R.image.icPower)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(.white)
            }
            .frame(width: 120, height: 120, alignment: .center)
            .background(Color(vpnEnabled
                              ? R.color.grPositive
                              : R.color.grAccent))
            .cornerRadius(120)
            Text(vpnEnabled ? R.string.localizable.homeVpnStateOn : R.string.localizable.homeVpnStateOff)
                .foregroundColor(Color(R.color.grSecondary))
                .font(.caption)
                .fontWeight(.semibold)
            Text(byeDPIProxyAddr)
                .foregroundColor(Color(R.color.grSecondary))
                .font(.headline)
                .fontWeight(.semibold)
            Spacer(minLength: 16)
            if (vpnEnabled) {
                Button {
                    if (showProxyEnabledHintAlert) {
                        return
                    }
                    showProxyEnabledHintAlert = true
                    DispatchQueue.main.asyncAfter(deadline: .now().advanced(by: DispatchTimeInterval.seconds(3))) {
                        if (!showProxyEnabledHintAlert) {
                            return
                        }
                        showProxyEnabledHintAlert = false
                    }
                } label: {
                    Text(R.string.localizable.generalSettings)
                }
                .padding(EdgeInsets(top: .zero, leading: 16.0, bottom: 12.0, trailing: 16.0))
            } else {
                NavigationLink {
                    SettingsScreen()
                } label: {
                    Text(R.string.localizable.generalSettings)
                }
                .padding(EdgeInsets(top: .zero, leading: 16.0, bottom: 12.0, trailing: 16.0))
            }
        }
        .alert(isPresented: $showProxyEnabledHintAlert, content: {
            Alert(title: Text(R.string.localizable.homeSettingsAccessHint))
        })
        .alert(isPresented: $showProxyStartErrorAlert) {
            Alert(title: Text(R.string.localizable.homeStartByeDPIErrTitle), message: Text(proxyStartFailErrorText))
        }
    }
    
    fileprivate func toggleVpn() {
#if DEBUG
        if (ProcessInfo.processInfo.previewMode) {
            if (vpnEnabled) {
                proxyStartFailErrorText = "Preview error text"
                showProxyStartErrorAlert = true
                vpnEnabled = false
                return
            }
            proxyStartFailErrorText = ""
            vpnEnabled = true
            return
        }
#endif
        proxyStartFailErrorText = ""
        if (vpnEnabled) {
            _ = ByeDPI.stop()
            vpnEnabled = false
            return
        }
        if (properties.byeDPILaunchConfig.listenIP == "0.0.0.0") {
            lnwPermissionManager.checkAndRequestPermission { status in
                print(status)
            }
        }
        let args = properties.byeDPILaunchConfig.args
        vpnEnabled = true
        ByeDPI.start(args: args) { startErr in
            self.vpnEnabled = false
            self.proxyStartFailErrorText = startErr.errorDescription
            self.showProxyStartErrorAlert = true
            _ = ByeDPI.stop()
        }
    }
}

#if DEBUG
#Preview {
    NavigationView {
        HomeScreen()
    }
    .environmentObject(previewProperties)
    .environmentObject(previewLnwPermissionManager)
    .environmentObject(previewDomainsManager)
    .environmentObject(previewStrategiesManager)
    .environmentObject(previewByeDPIManager)
    .environmentObject(previewTestManager)
}
#endif
