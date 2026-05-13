import SwiftUI

struct ListOfTheAlarmsView: View {
//    var alarmViewModels: [AlarmModel]
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @State var isActive = false
    @State var currentIndex: Int? = nil
    @State var addEditViewType: AddEditViewType = .standard
//    @State var addEditViewType: AddEditViewType = .circular
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(lnManager.alarmViewModels.indices, id: \.self) { i in
                            AlarmRowViewButton(
                                model: lnManager.alarmViewModels[i],
                                i: i,
                                currentIndex: $currentIndex,
                                isActive: $isActive
                            )
                        }
                        .onDelete(perform: deleteMe)
                    }
                    
                    Text("buttons")
                }
                FourCoolCircles()
                    .opacity(0.3)
            }
            .navigationTitle("Alarm List")
            .sheet(
                isPresented: $isActive
            ) {
                ChooseAlarmView(currentAlarmIndex: $currentIndex, addEditViewType: addEditViewType)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button(action: {
                        isActive.toggle()
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
            lnManager
                .removeRequest(id: lnManager.alarmViewModels[index].id)
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
