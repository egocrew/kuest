//
//  SignView.swift
//  kuest
//
//  Created by 양지수 on 2020/12/03.
//

import SwiftUI

struct SignView: View {
    @ObservedObject var view: ViewFlag
    @State var loading = false
    
    var body: some View {
        ZStack{
            Image("bg.sign")
                .resizable()
                .edgesIgnoringSafeArea(.vertical)
                .scaledToFill()
            Rectangle()
                .fill(Color.black)
                .edgesIgnoringSafeArea(.vertical)
                .scaledToFit()
                .opacity(0.8)
            VStack(spacing:0){
                Spacer()
                
                //서비스 이름
                Text("Time Again")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("for egoist Crew")
                    .font(.body)
                    .fontWeight(.bold)
                // 뒤에 이미지
                Spacer()
                // 서비스 시작하기
                Text("시작하기")
                    .font(.body)
                // 로그인 버튼 3개
                HStack{
//                    // 구글 로그인
//                    ZStack{
//                        Circle()
//                            .fill(Color.white)
//                            .frame(width: 60, height: 60)
//                        Image("social.google.black")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 20, height: 20)
//                    }.onTapGesture {
//                        SocialSign().signIn(platform: "google")
//                        loading.toggle()
//                    }.disabled(loading)
//                    .padding()
//
                    
                    
                    // 카카오 로그인
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width: 60, height: 60)
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }.onTapGesture {
                        SocialSign().signIn(platform: "kakao")
                        loading.toggle()
                    }.disabled(loading)
                    .padding()
                    
//                    // 애플 로그인
//                    ZStack{
//                        Circle()
//                            .fill(Color.white)
//                            .frame(width: 60, height: 60)
//                        Image("social.apple.black")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 20, height: 20)
//                    }.onTapGesture {
//                        SocialSign().signIn(platform: "google")
//                        loading.toggle()
//                    }.disabled(loading)
//                    .padding()
                    
                }.scaledToFit()
                
            }
            
        }
    }
}

