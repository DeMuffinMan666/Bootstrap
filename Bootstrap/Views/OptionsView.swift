//
//  OptionsView.swift
//  Bootstrap
//
//  Created by haxi0 on 31.12.2023.
//

import SwiftUI

struct OptionsView: View {
    @Binding var showOptions: Bool
    @Binding var openSSH: Bool
    @State private var showAppView = false
    
    var body: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .regular))
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("设置")
                        .bold()
                        .frame(maxWidth: 250, alignment: .leading)
                        .font(Font.system(size: 35))
                    
                    Button {
                        withAnimation {
                            showOptions.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 25, height: 25)
                    }
                }
                
                ScrollView {
                    VStack {
                        VStack {
                            Text("选项")
                                .foregroundColor(Color(UIColor.label))
                                .bold()
                                .font(Font.system(size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Divider()
                            
                            Toggle(isOn: $openSSH, label: {
                                Label(
                                    title: { Text("启用 SSH") },
                                    icon: { Image(systemName: "terminal") }
                                )
                            })
                        }
                        .frame(width: 253)
                        .padding(20)
                        .background {
                            Color(UIColor.systemBackground)
                                .cornerRadius(20)
                                .opacity(0.5)
                        }
                        
                        VStack {
                            Text("注入插件")
                                .foregroundColor(Color(UIColor.label))
                                .bold()
                                .font(Font.system(size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Divider()
                            
                            VStack(alignment: .leading, spacing: 12, content: {
                                Button {
                                    showAppView.toggle()
                                } label: {
                                    Label(
                                        title: { Text("选项应用程序") },
                                        icon: { Image(systemName: "app") }
                                    )
                                }
                                .buttonStyle(DopamineButtonStyle())
                                
                                Button {
                                    rebuildappsFr()
                                } label: {
                                    Label(
                                        title: { Text("重建应用程序") },
                                        icon: { Image(systemName: "arrow.clockwise") }
                                    )
                                }
                                .buttonStyle(DopamineButtonStyle())
                            })
                        }
                        .frame(width: 253)
                        .padding(20)
                        .background {
                            Color(UIColor.systemBackground)
                                .cornerRadius(20)
                                .opacity(0.5)
                        }
                    }
                    .disabled(!isSystemBootstrapped())
                }
            }
            .frame(maxHeight: 550)
        }
        .sheet(isPresented: $showAppView) {
            AppViewControllerWrapper()
        }
    }
}
