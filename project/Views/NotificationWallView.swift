import SwiftUI

struct NotificationWallView: View {
    @State private var showPopup: Bool = true // Controls the basketball game popup visibility
    @State private var selectedNotification: NotificationItem? = nil // For the tapped notification

    // Notifications
    let notifications: [NotificationItem] = [
        NotificationItem(icon: "🎉", title: "Coupon Code!", message: "Get 20% OFF your next purchases!! Code: AUBH20"),
        NotificationItem(icon: "🏆", title: "New MATH Challenge!", message: "Compete in the AUBH Annual PI day quiz and win exclusive rewards from the faculty and staff!"),
        NotificationItem(icon: "🇧🇭", title: "National Day Celebration", message: "Join us in celebrating Bahrain's National Day at the campus canopy!"),
        NotificationItem(icon: "📣", title: "Student Announcement", message: "Finals Schedules are out. Check your portal."),
        NotificationItem(icon: "🎲", title: "Activity Alert!", message: "Our student councils invites you all to join us for Game Night on Friday Decemeber 19 at 6 PM."),
        NotificationItem(icon: "🎓", title: "Graduation!", message: "Class of 2025: Graduation ceremony registration is now open, register to recieve your gown and tassles."),
        NotificationItem(icon: "🎭", title: "Auditorium Event", message: "Don't miss the FLOWARD CEO panel at 2 PM in the auditorium."),
        NotificationItem(icon: "💡", title: "IEEE Club Seminar", message: "Attend the seminar on third modeling techniques this Wednesday December 5 at 3 PM."),
        NotificationItem(icon: "📅", title: "Event Reminder", message: "Don’t forget the Open Mic Night this Thursday at 7 PM in the student commons."),
        NotificationItem(icon: "💼", title: "Career Fair Alert", message: "Meet top recruiters at the AUBH Career Fair next week in the main hall."),
        NotificationItem(icon: "🛍️", title: "Merch Sale", message: "Exclusive offer: Buy 1 Get 1 Free on all AUBH merchandise this weekend!")
   
    ]

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                // Header
                Text("AUBH's")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.horizontal)
 

                
                
                Text("Announcements!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .foregroundColor(.blue)


                // Notification List
                ScrollView {
                    ForEach(notifications) { notification in
                        Button(action: {
                            selectedNotification = notification // Show details for the tapped notification
                        }) {
                            HStack(alignment: .center, spacing: 12) {
                                // Centered Icon
                                Text(notification.icon)
                                    .font(.largeTitle)
                                    .frame(width: 50, height: 50) // Ensures emoji stays centered
                                    .background(Color(red: 0.9, green: 0.95, blue: 1)) // Matches background
                                    .clipShape(Circle()) // Optional: Make it circular

                                // Notification Details
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(notification.title)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text(notification.message)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .lineLimit(1) // Truncates long messages
                                }
                                .padding(.vertical, 8)
                            }
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle()) // Removes button highlighting
                    }
                }
                .padding(.top)

                Spacer()
            }
            .background(Color(red: 0.9, green: 0.95, blue: 1)) // Light blue background
            .navigationTitle("Notification Wall")
            .navigationBarTitleDisplayMode(.inline)

            // Basketball Game Popup
            if showPopup {
                VStack {
                    
                    VStack(spacing: 20) {
                        Text("🏀")
                            .font(.largeTitle)
                        Text("There is a AUBH Boys Basketball Game coming up soon!")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        Text("Get your merch now!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Button(action: {
                                showPopup = false // Close popup
                            }) {
                                Text("Coming!")
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                            
                            Button(action: {
                                showPopup = false // Close popup
                            }) {
                                Text("Can't Wait!")
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 20)
                    .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.4))
                .ignoresSafeArea()
            }

            // Notification Details Popup
            if let notification = selectedNotification {
                VStack {
                    Spacer() // Push content down to center vertically
                    
                    VStack(spacing: 20) { // Notification details in the middle
                        Text(notification.icon)
                            .font(.largeTitle)
                        Text(notification.title)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(notification.message)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            selectedNotification = nil // Close the details popup
                        }) {
                            Text("Close")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 20)
                    
                    Spacer() // Push content up to center vertically
                }
                .background(Color.black.opacity(0.4))
                .ignoresSafeArea()
    
            }
        }
    }
}

struct NotificationItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let message: String
}

#Preview {
    NotificationWallView()
}
