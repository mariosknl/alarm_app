import SwiftUI

struct ToBedWalkUpView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        VStack {
            CancelSaveAlarm(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
            
            Text("Toggle Alarm")
            
            Divider()
            
            HStack {
                Grid {
                    GridRow {
                        TimeOfDayIcon(date: alarmModel.start)
                            .font(.largeTitle)
                      VStack(alignment: .leading) {
                            GrayedTextView(text: "start")
                          
                          Text("Time Picker")
                        }
                    }
                    
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height:30)
                                .padding(2)
                        }
                    }
                    
                    GridRow {
                        Image(systemName: alarmModel.activity)
                            .foregroundColor(alarmModel.activityColor)
                            .font(.headline)
                        
                        Text("SelectActivityView")
                    }
                    .padding(.vertical)
                    
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                                .padding(2)
                        }
                    }
                    
                    GridRow {
                        TimeOfDayIcon(date: alarmModel.start)
                            .font(.largeTitle)
                      VStack(alignment: .leading) {
                          Text("Time Picker")
                          
                          GrayedTextView(text: "end")
                        }
                    }
                    
                    GridRow {
                        Text("")
                        HStack {
                            Text("Sound")
                                .fontWeight(.semibold)
                            Text(alarmModel.sound.rawValue)
                                .font(.caption)
                                .fontWeight(.thin)
                        }
                        .padding(7)
                        .overlay(
                            Capsule()
                                .stroke()
                                .contextMenu {
                                    ForEach(Sounds.allCases, id: \.self) { sound in
                                        Button(action: {
                                            alarmModel.sound = sound
                                        }, label: {
                                            Text(sound.rawValue)
                                        })
                                    }
                                }).padding(.vertical)
                            
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }.padding()
        }.padding().background(
            cardBackgroundColor.cornerRadius(20)
        ).padding()
    }
}

#Preview {
    ToBedWalkUpView(
        currentAlarmIndex: nil,
        alarmModel: .DefaultAlarm()
    )
}
