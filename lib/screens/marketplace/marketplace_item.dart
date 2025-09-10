import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qoruz_market_app/core/app_theme.dart';
import '../../models/marketplace_item.dart';
import 'marketplace_detail_screen.dart';
import 'package:readmore/readmore.dart';

class MarketplaceItemWidget extends StatelessWidget {
  final MarketplaceItem item;

  const MarketplaceItemWidget({super.key, required this.item});

  final String locations = "Bengaluru, Tamilnadu, Kerala, Goa";

  void navigateToDetailsScreen(BuildContext context) {
    Fluttertoast.showToast(msg: "${item.userName} moved!");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MarketplaceDetailScreen(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            color: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () =>
                  Fluttertoast.showToast(msg: "${item.userName} clicked!"),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User info with high value indicator
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: CachedNetworkImageProvider(
                            item.userImage,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.userName, style: AppTheme.heading3),
                              SizedBox(height: 2),
                              Text(
                                '${item.userTitle}${item.userCompany.isNotEmpty ? ' at ${item.userCompany}' : ''}',
                                style: AppTheme.bodyText,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 12,
                                    color: Colors.grey[500],
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    item.createdAt,
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => navigateToDetailsScreen(context),
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Post title
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 20,
                          color: AppTheme.primaryPink,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Looking for ${item.postTitle}",
                          style: AppTheme.label2,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Divider(color: AppTheme.borderLight),
                    ),
                    SizedBox(height: 12),

                    // Details
                    if (item.budget != 'Not specified')
                      _buildDetailRow('Budget:', item.budget),
                    if (item.brand != 'Not specified')
                      _buildDetailRow('Brand:', item.brand),
                    if (item.location != 'Not specified')
                      _buildDetailRow('Location:', item.location),
                    if (item.type != 'Not specified')
                      _buildDetailRow('Type:', item.type),
                    if (item.language != 'Not specified')
                      _buildDetailRow('Language:', item.language),

                    SizedBox(height: 8),

                    // Description
                    ReadMoreText(
                      item.description,
                      style: AppTheme.bodyText,
                      // maxLines: 10,
                      trimMode: TrimMode.Line,
                      trimLines: 6,
                      colorClickableText: AppTheme.borderLight,
                      trimCollapsedText: '...see more',
                      trimExpandedText: '...see less',
                    ),

                    SizedBox(height: 12),

                    if (item.tags.isNotEmpty)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.pin_drop,
                              size: 14,
                              color: AppTheme.iconColorLight,
                            ),
                            Expanded(
                              child: ReadMoreText(
                                locations,
                                trimLength: 25,
                                trimMode: TrimMode.Length,
                                colorClickableText: AppTheme.borderLight,
                                trimCollapsedText: "...",
                                trimExpandedText: "...",
                                style: AppTheme.caption,
                              ),
                            ),
                          ],
                        ),
                      ),

                    if (item.tags.isNotEmpty) SizedBox(height: 8),

                    if (item.tags.isNotEmpty)
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.facebook,
                                  size: 14,
                                  color: AppTheme.iconColorLight,
                                ),
                                SizedBox(width: 4),
                                Text("10K - 100K", style: AppTheme.caption),
                              ],
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.event_repeat_sharp,
                                  size: 14,
                                  color: AppTheme.iconColorLight,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "LifeStyle, Fashion",
                                  style: AppTheme.caption,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    // Tags
                    // if (item.tags.isNotEmpty)
                    //   Wrap(
                    //     spacing: 8,
                    //     children: item.tags.take(3).map((tag) {
                    //       return Chip(
                    //         label: Text(tag, style: TextStyle(fontSize: 12)),
                    //         backgroundColor: Colors.grey[100],
                    //         materialTapTargetSize:
                    //             MaterialTapTargetSize.shrinkWrap,
                    //       );
                    //     }).toList(),
                    //   ),
                  ],
                ),
              ),
            ),
          ),
          if (item.isHighValue)
            Positioned(
              right: 40,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  gradient: AppTheme.highValueGradient,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.white),
                      SizedBox(width: 6),
                      Text("High Value", style: AppTheme.highLable),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 14),
          children: [
            TextSpan(text: '$label ', style: AppTheme.bodyText),
            TextSpan(text: value, style: AppTheme.bodyText),
          ],
        ),
      ),
    );
  }
}
