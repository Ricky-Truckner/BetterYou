import SwiftUI

struct AccountView: View {
    
    
    var body: some View {
    NavigationView{
         ScrollView{
              VStack{
                    Text("Welcome User")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 20)
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(150)
                        .padding(.bottom, 10)
                    
                    
                }
                    NavigationLink(destination:TrackingView()){
                    Button {
                    } label: {
                        Text("Press Me!")
                    }
                    .frame(maxWidth: .infinity, minHeight: 48)
                    .background(Color.cyan)
                    .tint(.white)
                    .clipShape(RoundedRectangle(cornerRadius:8))
                    .padding(5)
                }
                Button {
                } label: {
                    Text("Press Me!")
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(Color.purple)
                .tint(.white)
                .clipShape(RoundedRectangle(cornerRadius:8))
                .padding(5)
                
                Button {
                } label: {
                    Text("Press Me!")
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(Color.cyan)
                .tint(.white)
                .clipShape(RoundedRectangle(cornerRadius:8))
                .padding(5)
                Button {
                } label: {
                    Text("Press Me!")
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(Color.purple)
                .tint(.white)
                .clipShape(RoundedRectangle(cornerRadius:8))
                .padding(5)
                Button {
                } label: {
                    Text("Press Me!")
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(Color.cyan)
                .tint(.white)
                .clipShape(RoundedRectangle(cornerRadius:8))
                .padding(5)
                
                
                
            }
            .background(.white)
            .scrollContentBackground(.hidden)
            
        }
        
    }
    
    
    struct AccountView_Previews: PreviewProvider {
        static var previews: some View {
            AccountView()
        }
    }
}
