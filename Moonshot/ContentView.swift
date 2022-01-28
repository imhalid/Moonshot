//
//  ContentView.swift
//  Moonshot
//
//  Created by Halid İçli on 27.01.2022.
//

import SwiftUI


struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State var gridlist = false
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @Namespace var namespace
    var body: some View {
        NavigationView {
            ScrollView {
                if gridlist {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    VStack {
                                        Text(mission.displayName)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Text(mission.formattedLaunchDate)
                                            .font(.callout)
                                            .foregroundColor(.white.opacity(0.5))
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                                )
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                } else {
                        ForEach(missions) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                ZStack {
                                    Color.lightBackground
                                        .cornerRadius(10)
                                    HStack {
                                        Image(mission.image)
                                            .resizable()
                                        
                                            .scaledToFit()
                                        
                                            .frame(width: 50, height: 50)
                                        
                                            .padding()
                                        Divider()
                                        VStack(alignment: .leading) {
                                            Text(mission.displayName)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            Text(mission.formattedLaunchDate)
                                                .font(.callout)
                                                .foregroundColor(.white.opacity(0.5))
                                            
                                        }
                                        .padding(.vertical)
                                        Spacer()
                                        .frame(maxWidth: .infinity)
    //                                    .background(.lightBackground)
    //                                    .cornerRadius(10)
                                        
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                )
                                }
                            }
                        }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("MoonShow")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button  {
                    withAnimation {
                        gridlist.toggle()
                    }
                } label: {
                    if gridlist {
                        Image(systemName: "list.bullet.circle")
                            .matchedGeometryEffect(id: "icon", in: namespace)
                    } else {
                        Image(systemName: "circle.grid.3x3.circle")
                            .matchedGeometryEffect(id: "icon", in: namespace)
                    }
                }

        
        }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
