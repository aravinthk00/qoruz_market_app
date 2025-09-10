import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/app_theme.dart';
import '../../models/marketplace_item.dart';

class MarketplaceDetailScreen extends StatelessWidget {
  final MarketplaceItem item;

  const MarketplaceDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: 35, color: AppTheme.textSecondary),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              size: 30,
              color: AppTheme.primaryPink,
            ),
            onPressed: () {
              Fluttertoast.showToast(msg: 'Delete clicked');
            },
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: AppTheme.appBarGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: Icon(Icons.share, size: 30, color: Colors.white),
              onPressed: () {
                Fluttertoast.showToast(msg: 'Share clicked');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: CachedNetworkImageProvider(
                          item.userImage,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.userName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              item.userTitle,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Icon(
                                  Icons.factory,
                                  size: 14,
                                  color: AppTheme.iconColorLight,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  item.userCompany,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            item.createdAt,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Post title
                        Text("Looking for", style: AppTheme.bodyText),
                        Row(
                          children: [
                            Icon(
                              Icons.sunny,
                              size: 20,
                              color: AppTheme.primaryPink,
                            ),
                            SizedBox(width: 4),
                            Text(
                              item.postTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(color: AppTheme.borderLight),
                        ),
                        SizedBox(height: 8),
                        // Highlights
                        if(item.budget != 'Not specified' || item.brand != 'Not specified')
                          Text(
                          'Highlights',
                          style: AppTheme.bodyText.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        if(item.budget != 'Not specified' || item.brand != 'Not specified') SizedBox(height: 8),
                        if(item.budget != 'Not specified' || item.brand != 'Not specified') 
                          Row(
                          children: [
                            if (item.budget != 'Not specified')
                              _buildHighlightRow('Budget:', item.budget),
                            if (item.brand != 'Not specified')
                              _buildHighlightRow('Brand:', item.brand),
                          ],
                        ),
                        SizedBox(height: 8),
                        // Description
                        Text(item.description, style: TextStyle(fontSize: 14)),
                        SizedBox(height: 16),
                        // Share buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Fluttertoast.showToast(
                                    msg: 'Sharing via WhatsApp',
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  backgroundColor: AppTheme.whatsappteaGreen,
                                  side: BorderSide(
                                    color: AppTheme.whatsappteaGreen,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/whatsapp_logo.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Share via ',
                                      style: AppTheme.bodyText,
                                    ),
                                    Text(
                                      'WhatsApp',
                                      style: AppTheme.bodyText.copyWith(
                                        color: AppTheme.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Fluttertoast.showToast(
                                    msg: 'Sharing on LinkedIn',
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  backgroundColor: AppTheme.linkedInBlue
                                      .withValues(alpha: 0.2),
                                  side: BorderSide(
                                    color: AppTheme.linkedInBlue.withValues(
                                      alpha: 0.05,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Image.asset(
                                        'assets/images/linkedin_logo.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text('Share on ', style: AppTheme.bodyText),
                                    Text(
                                      'LinkedIn',
                                      style: AppTheme.bodyText.copyWith(
                                        color: AppTheme.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        // Key Highlighted Details
                        if (item.requestDetails != null)
                          _buildRequestDetails(item.requestDetails!),

                        SizedBox(height: 32)
                      ],
                      
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
      persistentFooterButtons: [
        Material(
          elevation: 0.0,
          color: Colors.white,
          child: _buildExpiryContainer())
      ],
    );
  }

  Widget _buildHighlightRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.pin_drop, size: 14, color: AppTheme.iconColorLight),
              SizedBox(width: 4),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14),
                  children: [
                    TextSpan(text: '• $label ', style: AppTheme.bodyText),
                    TextSpan(text: value, style: AppTheme.bodyText),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequestDetails(Map<String, dynamic> requestDetails) {
    final followersRange = requestDetails['followers_range'] ?? {};
    final categories =
        (requestDetails['categories'] as List<dynamic>?)?.cast<String>() ?? [];
    final languages =
        (requestDetails['languages'] as List<dynamic>?)?.cast<String>() ?? [];
    final platforms =
        (requestDetails['platform'] as List<dynamic>?)?.cast<String>() ?? [];
    final cities =
        (requestDetails['cities'] as List<dynamic>?)?.cast<String>() ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Highlighted Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),

        SizedBox(height: 12),

        Table(
          columnWidths: {0: FlexColumnWidth(2), 1: FlexColumnWidth(2)},
          children: [
            if (categories.isNotEmpty || platforms.isNotEmpty)
              _buildTableRow(
                'Category',
                categories.join(', '),
                'Position',
                platforms.join(', '),
              ),
            if (languages.isNotEmpty || cities.isNotEmpty)
              _buildTableRow(
                'Language',
                languages.join(', '),
                'Location',
                cities.join(', '),
              ),
            if (requestDetails['creator_count_min'] != null &&
                    requestDetails['creator_count_max'] != null ||
                requestDetails['budget'] != null)
              _buildTableRow(
                'Required count',
                '${requestDetails['creator_count_min']} - ${requestDetails['creator_count_max']}',
                'Our Budget',
                requestDetails['budget'] ?? '',
              ),
            if (followersRange['ig_followers_min'] != null &&
                    followersRange['ig_followers_max'] != null ||
                requestDetails['brand'] != null)
              _buildTableRow(
                'Brand cable with Bucary',
                requestDetails['brand'] ?? '',
                'Required followers',
                '${followersRange['ig_followers_min']} - ${followersRange['ig_followers_max']}',
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpiryContainer() {
// Expiry notice (static for design)
    return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Your post will be expired on 25 July',
                              style: AppTheme.caption.copyWith(
                                color: AppTheme.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Fluttertoast.showToast(msg: 'Edit clicked');
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      25,
                                    ),
                                  ),
                                ),
                                child: Text('Edit'),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Fluttertoast.showToast(msg: 'Close clicked');
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      25,
                                    ),
                                  ),
                                ),
                                child: Text('Close'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
  }

  TableRow _buildTableRow(
    String label1,
    String value1,
    String label2,
    String value2,
  ) {
    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label1, style: AppTheme.label2),
                Text(value1, style: AppTheme.bodyText),
              ],
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label2, style: AppTheme.label2),
                Text(value2, style: AppTheme.bodyText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
