//
//  WalkthroughView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/7/24.
//


import SwiftUI

struct WalkthroughView: View {
    @State private var activeIntro: PageIntro = pageIntros[0]
    @State private var emailID: String = ""
    @State private var keyboardHeight: CGFloat = 0
    @State private var shouldNavigateToHome: Bool = false
    @AppStorage("hasCompletedWalkthrough") private var hasCompletedWalkthrough = false
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size

            NavigationView {
                IntroView(intro: $activeIntro, size: size) {
                    VStack(spacing: 10) {
                        /// Custom TextField
                        WalkthroughTextField(text: $emailID, hint: "Email Address or Username", leadingIcon: Image(systemName: "envelope"))

                        Spacer(minLength: 10)

                        NavigationLink(destination: HomeView(), isActive: $shouldNavigateToHome) {
                            EmptyView()
                        }
                        .hidden()

                        Button(action: {
                            hasCompletedWalkthrough = true
                            shouldNavigateToHome = true
                            print("Continue button tapped")
                            requestNotificationPermission { granted in
                            if granted {
                            // Permission granted, now schedule the notification
                                sendWelcomePushNotification(email: emailID)
                            } else {
                            // Permission denied, handle accordingly
                            print("Unable to schedule notification due to permission denial.")
                            }
                        }
                        }) {
                            Text("Continue")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 15)
                                .frame(maxWidth: .infinity)
                                .background(Capsule().fill(emailID.isEmpty ? Color.gray.opacity(0.5) :Color.red))
                                .opacity(emailID.isEmpty ? 0.5 : 1.0)
                        }
                        .disabled(emailID.isEmpty)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                }
//                .keyboardAware()
//                .padding(.bottom, keyboard.currentHeight)
                
            }
        }
        .padding([.horizontal, .top], 15)
        
        .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0), value: keyboardHeight)
    }
}


/// Intro View
struct IntroView<ActionView: View>: View {
    @Binding var intro: PageIntro
    var size: CGSize
    var actionView: ActionView

    init(intro: Binding<PageIntro>, size: CGSize, @ViewBuilder actionView: @escaping () -> ActionView) {
        self._intro = intro
        self.size = size
        self.actionView = actionView()
    }

    /// Animation Properties
    @State private var showView: Bool = false
    @State private var hideWholeView: Bool = false
    var body: some View {
        VStack {
            /// Image View
            GeometryReader {
                let size = $0.size

                Image(intro.introAssetImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: size.width, height: size.height)
            }
            /// Moving Up
            .offset(y: showView ? 0 : -size.height / 2)
            .opacity(showView ? 1 : 0)

            /// Title & Action's
            VStack(alignment: .leading, spacing: 10) {
                Spacer(minLength: 0)

                Text(intro.title)
                    .font(.system(size: 40))
                    .fontWeight(.black)

                Text(intro.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)

                if !intro.displaysAction {
                    Group {
                        Spacer(minLength: 25)

                        /// Custom Indicator View
                        WalkthroughIndicatorView(totalPages: filteredPages.count, currentPage: filteredPages.firstIndex(of: intro) ?? 0)
                            .frame(maxWidth: .infinity)

                        Spacer(minLength: 10)

                        Button {
                            changeIntro()
                        } label: {
                            Text("Next")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: size.width * 0.4)
                                .padding(.vertical, 15)
                                .background {
                                    Capsule()
                                        .fill(.red)
                                }
                        }
                        .frame(maxWidth: .infinity)
                    }
                } else {
                    actionView
                        .offset(y: showView ? 0 : size.height / 2)
                        .opacity(showView ? 1 : 0)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            /// Moving Down
            .offset(y: showView ? 0 : size.height / 2)
            .opacity(showView ? 1 : 0)
        }
        .offset(y: hideWholeView ? size.height / 2 : 0)
        .opacity(hideWholeView ? 0 : 1)
        /// Back Button
        .overlay(alignment: .topLeading) {
            /// Hiding it for Very First Page, Since there is no previous page present
            if intro != pageIntros.first {
                Button {
                    changeIntro(true)
                } label : {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.red)
                        .contentShape(Rectangle())
                }
                .padding(10)
                /// Animating Back Button
                /// Comes From Top When Active
                .offset(y: showView ? 0 : -200)
                /// Hides by Going back to Top When In Active
                .offset(y: hideWholeView ? -200 : 0)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)) {
                showView = true
            }
        }
    }

    /// Updating Page Intro's
    func changeIntro(_ isPrevious: Bool = false) {
        withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)) {
            hideWholeView = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let index = pageIntros.firstIndex(of: intro), (isPrevious ? index != 0 : index != pageIntros.count - 1) {
                intro = isPrevious ? pageIntros[index - 1] : pageIntros[index + 1]
            } else {
                intro = isPrevious ? pageIntros[0] : pageIntros[pageIntros.count - 1]
            }
            /// Re-Animating as Split Page
            hideWholeView = false
            showView = false

            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)) {
                showView = true
            }
        }
        print("Intro changed")
    }

    var filteredPages: [PageIntro] {
        return pageIntros.filter { !$0.displaysAction }
    }
}
