//
//  ContentView.swift
//  week7_assignment
//
//  Created by 이상엽 on 6/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopLogoBar()
            CategoryButtons()
            ScrollView{
                YournameImage()
                TodayTIVING()
                PopularLives()
                PopularMovies()
                BaseballButtons()
                EtcPlayButtons()
                MasterpieceMovies()
                NotificationView()
                ServiceInfomationView()
            }
        }.background(.black)
    }
}

struct TopLogoBar: View {
    var body: some View {
        HStack{
            Image("top_logo_tving")
                .resizable()
                .frame(width: 191, height: 78)
            
            Spacer()
            
            Button(action: {}) {
                Image("Search")
            }
            .padding(.trailing, 10)
            
            Button(action: {}) {
                Image("tving_button")
            }
            .padding(.trailing, 11)
        }
    }
}

struct CategoryButtons: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 28){
                Button(action: {}) {
                    Text("홈")
                        .foregroundStyle(.white)
                        .font(.body)
                }
                Button(action: {}) {
                    Text("드라마")
                        .foregroundStyle(.white)
                        .font(.body)
                }
                Button(action: {}) {
                    Text("예능")
                        .foregroundStyle(.white)
                        .font(.body)
                }
                Button(action: {}) {
                    Text("영화")
                        .foregroundStyle(.white)
                        .font(.body)
                }
                Button(action: {}) {
                    Text("스포츠")
                        .foregroundStyle(.white)
                        .font(.body)
                }
                Button(action: {}) {
                    Text("뉴스")
                        .foregroundStyle(.white)
                        .font(.body)
                }
            }
            Rectangle()
                .frame(width: 15, height: 3)
                .foregroundStyle(.white)
        }
    }
}

struct YournameImage: View {
    var body: some View {
        Image("yourname")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct TodayTIVING: View {
    let rows = [
        GridItem(.fixed(100))
    ]
    var body: some View {
        VStack(alignment: .leading){
            Text("오늘의 티빙 TOP 20")
                .foregroundStyle(.white)
                .font(.title3)
                .fontWeight(.bold)
            ScrollView(.horizontal){
                LazyHGrid(rows: rows, spacing: 16) {
                    ForEach(1...11, id: \.self) { index in
                        TodayTIVINGItems(index: index)
                    }
                }
            }
        }
        .padding(.top, 9)
    }
}

struct TodayTIVINGItems: View {
    var index: Int = 0
    var body: some View {
        HStack(alignment: .bottom){
            Text("\(index)")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .italic()
            Image("movie\(index)")
                .resizable()
                .frame(width: 98, height: 146)
        }
    }
}

struct PopularLives: View {
    let row =  [
        GridItem(.flexible(maximum: 160))
    ]
    var body: some View {
        VStack{
            HStack{
                Text("실시간 인기 Live")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {}){
                    Text("더보기")
                        .foregroundStyle(.gray2)
                }
            }
            ScrollView(.horizontal) {
                LazyHGrid(rows: row, spacing: 7) {
                    ForEach(1...6, id: \.self){ index in
                        PopularLivesItems(index: index)
                    }
                }
            }
        }
        .padding(.top, 12)
    }
}

struct PopularLivesItems: View {
    var index: Int = 0
    var body: some View {
        VStack(alignment: .leading){
            Image("live\(index)")
                .resizable()
                .frame(width: 160, height: 80)
            HStack(alignment: .top) {
                Text("\(index)")
                    .foregroundStyle(.white)
                    .font(.title)
                    .italic()
                VStack(alignment: .leading) {
                    Text("JTBC")
                        .foregroundStyle(.white)
                        .font(.body)
                    Text("이혼술겨캠프 34회")
                        .foregroundStyle(.gray2)
                        .font(.caption)
                    Text("27.2%")
                        .foregroundStyle(.gray2)
                        .font(.caption)
                }
            }
        }
    }
}

struct PopularMovies: View {
    let row = [
        GridItem(.flexible(minimum: 10, maximum: 100))
    ]
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("실시간 인기 영화")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {}){
                    Text("더보기")
                        .foregroundStyle(.gray2)
                }
            }
            ScrollView(.horizontal){
                LazyHGrid(rows: row, spacing: 8) {
                    ForEach(1...11, id: \.self) { index in
                        Image("movie\(index)")
                            .resizable()
                            .frame(width: 98, height: 146)
                    }
                }
            }
        }
        .padding(.top, 18)
    }
}

struct BaseballButtons: View {
    let row = [
        GridItem(.fixed(70))
    ]
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: row) {
                ForEach(1...10, id: \.self) { index in
                    Image("baseball\(index)")
                        .resizable()
                        .frame(width:80, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .background(index % 2 == 1 ? .white : .black)
                }
            }
        }
        .padding(.top, 20)
    }
}

struct EtcPlayButtons: View {
    let row = [
        GridItem(.fixed(75))
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: row, spacing: 7) {
                ForEach(1...4, id: \.self) { index in
                    Image("etc\(index)")
                        .resizable()
                        .frame(width: 90, height: 45)
                        .background(.gray4)
                        .cornerRadius(8)
                }
            }
        }
    }
}

struct MasterpieceMovies: View {
    let row = [
        GridItem(.fixed(110))
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("이상엽PD의 인생작 TOP5")
                .foregroundStyle(.white)
                .font(.title3)
                .fontWeight(.bold)
            
            ScrollView(.horizontal){
                LazyHGrid(rows: row, spacing: 8) {
                    ForEach(1...6, id: \.self) { index in
                        Image("live\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160, height: 90)
                            .cornerRadius(3)
                    }
                }
            }
        }
        .padding(.top, 13)
        .padding(.bottom, 13)
    }
}

struct NotificationView: View {
    var body: some View {
        HStack{
            Text("공지")
                .foregroundStyle(.gray2)
                .font(.caption)
                .padding(.leading, 17)
            
            Text("티빙 계정 공유 정책 추가 안내")
                .foregroundStyle(.gray1)
                .font(.caption)
            
            Spacer()
            
            Button(action: {}){
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
            }
            .padding(.trailing, 16)
        }
        .frame(width: 347, height: 50)
        .background(.gray4)
        .cornerRadius(5)
    }
}

struct ServiceInfomationView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Button(action: {}){
                    Text("고객문의")
                        .foregroundStyle(.gray2)
                        .font(.caption2)
                }
                
                Button(action: {}){
                    Text("이용약관")
                        .foregroundStyle(.gray2)
                        .font(.caption2)
                }
                
                Spacer()
            }
            
            HStack{
                Button(action: {}){
                    Text("사업자정보")
                        .foregroundStyle(.gray2)
                        .font(.caption2)
                }
                
                Button(action: {}){
                    Text("인재채용")
                        .foregroundStyle(.gray2)
                        .font(.caption2)
                }
                
                Spacer()
            }
        }
        .padding(.leading, 20)
        .padding(.top, 7)
    }
}
