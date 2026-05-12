import SwiftUI

struct ListOfTheAlarmsView: View {
//    var alarmViewModels: [AlarmModel]
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @State var isActive = false
    @State var currentIndex: Int? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(lnManager.alarmViewModels.indices, id: \.self) { i in
                        
                        Button(action: {
                            currentIndex = i
                            isActive.toggle()
                        }, label: {
                            AlarmRowView(model: lnManager.alarmViewModels[i], i: i)
                                .padding(.vertical)
                        })
                    }
                    .onDelete(perform: deleteMe)
                }
                
                FourCoolCircles()
                    .opacity(0.3)
            }
            .navigationTitle("Alarm List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: {
                        MainAddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
                    }, label: {
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(black)
                    })
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteMe(offsets: IndexSet) {
        // Remove from pending alarms
        for index in offsets {
            // TODO: Remove request for given id
            print("remove request from \(lnManager.alarmViewModels[index].id)")
        }
        
        // Remove from the alarmViewModels
        lnManager.alarmViewModels
            .remove(atOffsets: offsets)
    }
}

#Preview {
    ListOfTheAlarmsView()
    .environmentObject(LocalNotificationManager())
}
