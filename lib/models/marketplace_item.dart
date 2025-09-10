class MarketplaceItem {
  final String idHash;
  final String userName;
  final String userTitle;
  final String userCompany;
  final String userImage;
  final String postTitle;
  final String budget;
  final String brand;
  final String location;
  final String type;
  final String language;
  final String description;
  final List<String> tags;
  final String createdAt;
  final String serviceType;
  final Map<String, dynamic>? requestDetails;
  final bool isHighValue;

  MarketplaceItem({
    required this.idHash,
    required this.userName,
    required this.userTitle,
    required this.userCompany,
    required this.userImage,
    required this.postTitle,
    required this.budget,
    required this.brand,
    required this.location,
    required this.type,
    required this.language,
    required this.description,
    required this.tags,
    required this.createdAt,
    required this.serviceType,
    required this.requestDetails,
    required this.isHighValue,
  });

  factory MarketplaceItem.fromJson(Map<String, dynamic> json) {
    // Safely extract user_details with proper type conversion
    final userDetails = json['user_details'] != null 
        ? Map<String, dynamic>.from(json['user_details']) 
        : <String, dynamic>{};
    
    // Safely extract request_details with proper type conversion
    final requestDetails = json['request_details'] != null 
        ? Map<String, dynamic>.from(json['request_details']) 
        : null;
    
    // Extract followers range safely
    final followersRange = requestDetails != null && requestDetails['followers_range'] != null
        ? Map<String, dynamic>.from(requestDetails['followers_range'])
        : <String, dynamic>{};
    
    // Extract languages from request details safely
    final languages = requestDetails != null && requestDetails['languages'] is List
        ? List<String>.from(requestDetails['languages'] as List)
        : <String>[];
    
    // Extract categories from request details safely
    final categories = requestDetails != null && requestDetails['categories'] is List
        ? List<String>.from(requestDetails['categories'] as List)
        : <String>[];
    
    // Extract platform from request details safely
    final platforms = requestDetails != null && requestDetails['platform'] is List
        ? List<String>.from(requestDetails['platform'] as List)
        : <String>[];
    
    // Extract cities from request details safely
    final cities = requestDetails != null && requestDetails['cities'] is List
        ? List<String>.from(requestDetails['cities'] as List)
        : <String>[];
    
    // Combine all tags
    final tags = [...languages, ...categories, ...platforms];
    
    // Get location information
    final location = cities.isNotEmpty 
        ? cities.join(', ') 
        : (json['is_pan_india'] == true ? 'Pan India' : 'Not specified');
    
    // Get budget from request details
    final budget = requestDetails != null && requestDetails['budget'] != null
        ? requestDetails['budget'].toString()
        : 'Not specified';
    
    // Get brand from request details
    final brand = requestDetails != null && requestDetails['brand'] != null
        ? requestDetails['brand'].toString()
        : 'Not specified';
    
    return MarketplaceItem(
      idHash: json['id_hash']?.toString() ?? '1',
      userName: userDetails['name']?.toString() ?? 'Unknown User',
      userTitle: userDetails['designation']?.toString() ?? 'Unknown Title',
      userCompany: userDetails['company']?.toString() ?? 'Unknown Company',
      userImage: userDetails['profile_image']?.toString() ?? 'https://via.placeholder.com/40',
      postTitle: json['service_type']?.toString() ?? 'No Title',
      budget: budget,
      brand: brand,
      location: location,
      type: categories.isNotEmpty ? categories.join(', ') : 'Not specified',
      language: languages.isNotEmpty ? languages.join(', ') : 'Not specified',
      description: json['description']?.toString() ?? 'No description available',
      tags: tags,
      createdAt: json['created_at']?.toString() ?? 'Unknown',
      serviceType: json['service_type']?.toString() ?? 'Not specified',
      requestDetails: requestDetails,
      isHighValue: json['is_high_value'] == true,
    );
  }
}