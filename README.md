# Qoruz Marketplace App
A Flutter-based marketplace application with a modern UI, real-time search functionality, and clean architecture implementation.

Features
🏪 Marketplace Listings: Browse through various marketplace items with detailed information

🔍 Real-time Search: Search across multiple fields including titles, descriptions, user info, and tags

📱 Tab Navigation: Organized content through categorized tabs (For You, Recent, My Requests, Top 1)

🎨 Custom UI Design: Beautiful curved tab design with dual-color theme (pink and orange)

🔄 Pagination: Infinite scroll with automatic loading of more items

🌙 Theme Support: Light and dark theme support

📊 Provider State Management: Efficient state management using Provider pattern

🌐 API Integration: REST API integration for dynamic content

💫 Smooth Animations: Polished user experience with smooth transitions

Color Scheme
Primary Pink: rgba(251, 42, 119, 1) - #FB2A77

Primary Orange: rgba(255, 115, 4, 1) - #FF7304

Secondary Colors: Lighter variants of the primary colors for gradients and accents

Project Structure
text
lib/
├── main.dart                 # Application entry point
├── theme/
│   └── app_theme.dart       # Custom theme configuration
├── models/
│   └── marketplace_item.dart # Data models
├── services/
│   └── marketplace_api.dart  # API service layer
├── providers/
│   └── marketplace_provider.dart # State management
├── screens/
│   └── marketplace_list_screen.dart # Main list screen
├── widgets/
│   ├── marketplace_item.dart      # Individual item widget
│   └── custom_tab_bar.dart        # Custom tab bar component
API Integration
The app integrates with the following API endpoints:

Listing Endpoint
text
GET https://staging1.hashfame.com/api/v1/interview.mplist?page={page_number}
Details Endpoint
text
GET https://staging1.hashfame.com/api/v1/interview.mplist?id_hash={item_id}
API Response Structure
The app expects the API to return data in the following format:

json
{
  "ok": true,
  "marketplace_requests": [
    {
      "id_hash": "string",
      "user_details": {
        "name": "string",
        "profile_image": "string",
        "company": "string",
        "designation": "string"
      },
      "is_high_value": boolean,
      "created_at": "string",
      "description": "string",
      "request_details": {
        "followers_range": {
          "ig_followers_min": "string",
          "ig_followers_max": "string",
          "yt_subscribers_min": "string",
          "yt_subscribers_max": "string"
        },
        "categories": ["string"],
        "creator_count_min": number,
        "creator_count_max": number,
        "budget": "string",
        "brand": "string",
        "languages": ["string"],
        "platform": ["string"],
        "cities": ["string"]
      },
      "status": "string",
      "service_type": "string",
      "target_audience": "string",
      "is_open": boolean,
      "is_pan_india": boolean,
      "any_language": boolean,
      "is_deal_closed": boolean,
      "slug": "string"
    }
  ],
  "pagination": {
    "has_more": boolean,
    "total": number,
    "count": number,
    "per_page": number,
    "current_page": number,
    "total_pages": number,
    "next_page_url": "string",
    "previous_page_url": "string",
    "url": "string"
  }
}
Installation
Clone the repository

bash
git clone <repository-url>
cd marketplace_app
Install dependencies

bash
flutter pub get
Run the application

bash
flutter run
Dependencies
The project uses the following dependencies:

provider: ^6.0.5 - State management

http: ^0.13.5 - HTTP client for API calls

fluttertoast: ^8.2.2 - Toast notifications

cached_network_image: ^3.3.0 - Image caching

intl: ^0.18.1 - Internationalization utilities

carousel_slider: ^4.2.1 - Image carousel support

Key Features Implementation
Search Functionality
Real-time search as you type

Multi-field search (title, description, user info, tags)

Case-insensitive search

Clear search functionality

Empty state handling

Tab System
Custom curved tab design

Four main categories: For You, Recent, My Requests, Top 1

Smooth tab transitions

Tab-specific content filtering

State Management
Provider pattern implementation

Efficient state updates

Separation of concerns

Easy-to-maintain code structure

UI/UX Design
Modern material design

Custom color scheme

Responsive layout

Smooth animations

Error handling states

Loading states

Getting Started
For Developers
Explore the lib/providers/marketplace_provider.dart for state management

Check lib/services/marketplace_api.dart for API integration

Review lib/theme/app_theme.dart for theme customization

Examine lib/widgets/ for reusable UI components

For Designers
The app uses a consistent color scheme defined in app_theme.dart

All UI components are built with customization in mind

The theme supports both light and dark modes

Contributing
Fork the repository

Create a feature branch (git checkout -b feature/amazing-feature)

Commit your changes (git commit -m 'Add some amazing feature')

Push to the branch (git push origin feature/amazing-feature)

Open a Pull Request

Known Issues
The app currently uses mock pagination logic (assumes more pages if 20+ items are returned)

Some API response fields might need additional mapping based on actual API structure

Future Enhancements
Add user authentication

Implement favorites/bookmark system

Add push notifications

Implement advanced filtering options

Add image caching optimization

Implement offline support

Add internationalization (i18n)

Implement deep linking

Support
For support or questions, please create an issue in the repository or contact the development team.

License
This project is licensed under the MIT License - see the LICENSE file for details.

Built with ❤️ using Flutter
