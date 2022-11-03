//
//  ContentView.swift
//  FakeLogIn
//
//  Created by 王浩源 on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    let trueaccount = "Zhanghao"
    let truepassword = "mima"
    @State var account = ""
    @State var password = ""
    @State var isClicked1: Bool = false
    @State var isClicked2: Bool = false
    var body: some View {
        NavigationView() {
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
                NavigationLink(destination: account == trueaccount && password == truepassword
                               ? Text("登录成功").font(.largeTitle).fontWeight(.heavy)
                               : Text("登录失败").font(.largeTitle).fontWeight(.heavy).foregroundColor(.red)){
                    Text("登录")
                        .frame(width: 80, height: 30 )
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .shadow( radius: 10, y: 10)
                .padding(.vertical, 50)
                Spacer()
                Link("清水河畔官网", destination: URL(string: "https://bbs.uestc.edu.cn")!)
            }
        }
    }
    
    func getFocus1(focused:Bool) {
            isClicked1 = focused
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







//
//struct Success: View {
//    var body: some View {
//        VStack(){
//            Text("登录成功")
//            Link("校车时刻表", destination: URL(string: "https://bbs.uestc.edu.cn/forum.php?mod=viewthread&tid=1430861")!)
//            Link("失物招领", destination: URL(string: "https://bbs.uestc.edu.cn/forum.php?mod=forumdisplay&fid=305")!)
//            Link("校历", destination: URL(string: "https://bbs.uestc.edu.cn/forum.php?mod=viewthread&tid=1493930")!)
//            Link("网上报修", destination: URL(string: "https://hq.uestc.edu.cn/web/detail.jsp?article_id=4645")!)
//            Link("一卡通查询", destination: URL(string: "http://ecard.uestc.edu.cn/")!)
//            Link("信息门户", destination: URL(string: "http://portal.uestc.edu.cn/")!)
//            Link("后勤建议", destination: URL(string: "https://hq.uestc.edu.cn/yzs/commentSite/commentSiteIndex")!)
//            Link("教务留言", destination: URL(string: "http://www.jwc.uestc.edu.cn/web/Message!queryList.action")!)
//            Link("DV成电", destination: URL(string: "http://dvcd.uestc.edu.cn/dvcd/index.aspx")!)
//        }
//    }
//}
//
//struct Failure: View {
//    var body: some View {
//        VStack(){
//            Image(systemName: "clear.fill")
//                .frame(width: 80, height: 80)
//            Text("登录失败！")
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .foregroundColor(.red)
//        }
//    }
//}
