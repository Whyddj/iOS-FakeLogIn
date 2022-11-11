//
//  ContentView.swift
//  FakeLogIn
//
//  Created by 王浩源 on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    @State var account = ""
    @State var password = ""
    @State var isClicked1: Bool = false
    @State var isClicked2: Bool = false
    @State var isture: isTure = isTure(rs: -1)
    var body: some View {
        ZStack() {
            
            VStack() {
                Image("image1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .cornerRadius(15)
                    .shadow(radius: 10,y: 10)
                    .padding(.vertical,80)
                VStack(){
                    HStack(){
                        Image(systemName: "person.fill")
                        TextField("Your Account", text: $account, onEditingChanged: getFocus1)
                            .accentColor(.blue)
                            .frame(height: 38)
                    }
                    Rectangle()
                        .frame( height: 3 )
                        .foregroundColor(isClicked1 ? .blue : .gray)
                }
                .shadow(radius: 10)
                .padding(.horizontal,40)
                
                VStack(){
                    HStack(){
                        Image(systemName: "lock.fill")
                        SecureField("Your Password", text: $password)
                            .accentColor(.blue)
                            .frame(height: 38)
                            .onTapGesture {
                                isClicked2 = true
                            }
                            .onSubmit {
                                isClicked2 = false
                                
                            }
                    }
                    Rectangle()
                        .frame( height: 3 )
                        .foregroundColor(isClicked2 ? .blue : .gray)
                }
                .shadow(radius: 10)
                .padding(.horizontal,40)
                .padding(.vertical)
                
                Button("登录") {
                    getdata(username: account, password: password)
                }
                    .frame(width: 80, height: 30 )
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow( radius: 10, y: 10)
                    .padding(.vertical, 50)
                    
                Spacer()
                Link("清水河畔官网", destination: URL(string: "https://bbs.uestc.edu.cn")!)
                
            }
            if isture.rs == 1 {
                Color.white.edgesIgnoringSafeArea(.all)
                Success()
            }
            if isture.rs == 0 {
                Color.white.edgesIgnoringSafeArea(.all)
                Failure()
            }
        }
    }
    
    struct isTure: Codable {
        var rs: Int
    }
    
    func getFocus1(focused:Bool) {
            isClicked1 = focused
        }
    
    func getdata (username:String, password:String ) {
        let url = URL(string: "https://bbs.uestc.edu.cn/mobcent/app/web/index.php?r=user/login&type=login&username="+username+"&password="+password)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let decodedResponse = try? JSONDecoder().decode(isTure.self, from: data!){
                print(decodedResponse)
                self.isture = decodedResponse
            }
        }.resume()
    }
}

struct Success: View {
    var body: some View {
        VStack(){
            Text("登录成功")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.green)
                .padding(.all)
            Link("校车时刻表", destination: URL(string: "https://bbs.uestc.edu.cn/forum.php?mod=viewthread&tid=1430861")!)
                .padding(.all)
            Link("失物招领", destination: URL(string: "https://bbs.uestc.edu.cn/forum.php?mod=forumdisplay&fid=305")!)
                .padding(.all)
            Link("校历", destination: URL(string: "https://bbs.uestc.edu.cn/forum.php?mod=viewthread&tid=1493930")!)
                .padding(.all)
            Link("网上报修", destination: URL(string: "https://hq.uestc.edu.cn/web/detail.jsp?article_id=4645")!)
                .padding(.all)
            Link("一卡通查询", destination: URL(string: "http://ecard.uestc.edu.cn/")!)
                .padding(.all)
            Link("信息门户", destination: URL(string: "http://portal.uestc.edu.cn/")!)
                .padding(.all)
            Link("后勤建议", destination: URL(string: "https://hq.uestc.edu.cn/yzs/commentSite/commentSiteIndex")!)
                .padding(.all)
            Link("教务留言", destination: URL(string: "http://www.jwc.uestc.edu.cn/web/Message!queryList.action")!) .padding(.all)
            Link("DV成电", destination: URL(string: "http://dvcd.uestc.edu.cn/dvcd/index.aspx")!)
                .padding(.all)
        }
    }
}

struct Failure: View {
    var body: some View {
        VStack(){
            Image(systemName: "clear.fill")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding(.all)
            Text("登录失败")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
