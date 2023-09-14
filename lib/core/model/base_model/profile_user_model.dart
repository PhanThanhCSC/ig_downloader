// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProfileUserModel welcomeFromJson(String str) =>
    ProfileUserModel.fromJson(json.decode(str));

String welcomeToJson(ProfileUserModel data) => json.encode(data.toJson());

class ProfileUserModel {
  List<List<String>?>? seoCategoryInfos;
  String? loggingPageId;
  bool? showSuggestedProfiles;
  Graphql? graphql;
  dynamic toastContentOnLoad;
  bool? showQrModal;
  bool? showViewShop;

  ProfileUserModel({
    required this.seoCategoryInfos,
    required this.loggingPageId,
    required this.showSuggestedProfiles,
    required this.graphql,
    required this.toastContentOnLoad,
    required this.showQrModal,
    required this.showViewShop,
  });

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) =>
      ProfileUserModel(
        seoCategoryInfos: [],
        loggingPageId: json["logging_page_id"],
        showSuggestedProfiles: json["show_suggested_profiles"],
        graphql: Graphql.fromJson(json["graphql"]),
        toastContentOnLoad: json["toast_content_on_load"],
        showQrModal: json["show_qr_modal"],
        showViewShop: json["show_view_shop"],
      );

  Map<String, dynamic> toJson() => {
        "seo_category_infos": '',
        "logging_page_id": loggingPageId,
        "show_suggested_profiles": showSuggestedProfiles,
        "graphql": graphql?.toJson(),
        "toast_content_on_load": toastContentOnLoad,
        "show_qr_modal": showQrModal,
        "show_view_shop": showViewShop,
      };
}

class Graphql {
  User? user;

  Graphql({
    required this.user,
  });

  factory Graphql.fromJson(Map<String, dynamic> json) => Graphql(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  String? biography;
  List<BioLink> bioLinks;
  dynamic fbProfileBiolink;
  BiographyWithEntities? biographyWithEntities;
  bool? blockedByViewer;
  bool? restrictedByViewer;
  bool? countryBlock;
  String? eimuId;
  String? externalUrl;
  String? externalUrlLinkshimmed;
  EdgeFollowClass? edgeFollowedBy;
  String? fbid;
  bool? followedByViewer;
  EdgeFollowClass? edgeFollow;
  bool? followsViewer;
  String? fullName;
  dynamic groupMetadata;
  bool? hasArEffects;
  bool? hasClips;
  bool? hasGuides;
  bool? hasChannel;
  bool? hasBlockedViewer;
  int highlightReelCount;
  bool? hasRequestedViewer;
  bool? hideLikeAndViewCounts;
  String? id;
  bool? isBusinessAccount;
  bool? isProfessionalAccount;
  bool? isSupervisionEnabled;
  bool? isGuardianOfViewer;
  bool? isSupervisedByViewer;
  bool? isSupervisedUser;
  bool? isEmbedsDisabled;
  bool? isJoinedRecently;
  dynamic guardianId;
  dynamic businessAddressJson;
  String? businessContactMethod;
  dynamic businessEmail;
  dynamic businessPhoneNumber;
  dynamic businessCategoryName;
  dynamic overallCategoryName;
  dynamic categoryEnum;
  String? categoryName;
  bool? isPrivate;
  bool? isVerified;
  bool? isVerifiedByMv4B;
  bool? isRegulatedC18;
  EdgeMutualFollowedBy? edgeMutualFollowedBy;
  int pinnedChannelsListCount;
  String? profilePicUrl;
  String? profilePicUrlHd;
  bool? requestedByViewer;
  bool? shouldShowCategory;
  bool? shouldShowPublicContacts;
  bool? showAccountTransparencyDetails;
  dynamic transparencyLabel;
  String? transparencyProduct;
  Username? username;
  dynamic connectedFbPage;
  List<dynamic> pronouns;
  EdgeFelixVideoTimelineClass? edgeFelixVideoTimeline;
  EdgeFelixVideoTimelineClass? edgeOwnerToTimelineMedia;
  EdgeFelixVideoTimelineClass? edgeSavedMedia;
  EdgeFelixVideoTimelineClass? edgeMediaCollections;

  User({
    required this.biography,
    required this.bioLinks,
    required this.fbProfileBiolink,
    required this.biographyWithEntities,
    required this.blockedByViewer,
    required this.restrictedByViewer,
    required this.countryBlock,
    required this.eimuId,
    required this.externalUrl,
    required this.externalUrlLinkshimmed,
    required this.edgeFollowedBy,
    required this.fbid,
    required this.followedByViewer,
    required this.edgeFollow,
    required this.followsViewer,
    required this.fullName,
    required this.groupMetadata,
    required this.hasArEffects,
    required this.hasClips,
    required this.hasGuides,
    required this.hasChannel,
    required this.hasBlockedViewer,
    required this.highlightReelCount,
    required this.hasRequestedViewer,
    required this.hideLikeAndViewCounts,
    required this.id,
    required this.isBusinessAccount,
    required this.isProfessionalAccount,
    required this.isSupervisionEnabled,
    required this.isGuardianOfViewer,
    required this.isSupervisedByViewer,
    required this.isSupervisedUser,
    required this.isEmbedsDisabled,
    required this.isJoinedRecently,
    required this.guardianId,
    required this.businessAddressJson,
    required this.businessContactMethod,
    required this.businessEmail,
    required this.businessPhoneNumber,
    required this.businessCategoryName,
    required this.overallCategoryName,
    required this.categoryEnum,
    required this.categoryName,
    required this.isPrivate,
    required this.isVerified,
    required this.isVerifiedByMv4B,
    required this.isRegulatedC18,
    required this.edgeMutualFollowedBy,
    required this.pinnedChannelsListCount,
    required this.profilePicUrl,
    required this.profilePicUrlHd,
    required this.requestedByViewer,
    required this.shouldShowCategory,
    required this.shouldShowPublicContacts,
    required this.showAccountTransparencyDetails,
    required this.transparencyLabel,
    required this.transparencyProduct,
    required this.username,
    required this.connectedFbPage,
    required this.pronouns,
    required this.edgeFelixVideoTimeline,
    required this.edgeOwnerToTimelineMedia,
    required this.edgeSavedMedia,
    required this.edgeMediaCollections,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        biography: json["biography"],
        bioLinks: List<BioLink>.from(
            json["bio_links"].map((x) => BioLink.fromJson(x))),
        fbProfileBiolink: json["fb_profile_biolink"],
        biographyWithEntities:
            BiographyWithEntities.fromJson(json["biography_with_entities"]),
        blockedByViewer: json["blocked_by_viewer"],
        restrictedByViewer: json["restricted_by_viewer"],
        countryBlock: json["country_block"],
        eimuId: json["eimu_id"],
        externalUrl: json["external_url"],
        externalUrlLinkshimmed: json["external_url_linkshimmed"],
        edgeFollowedBy: EdgeFollowClass.fromJson(json["edge_followed_by"]),
        fbid: json["fbid"],
        followedByViewer: json["followed_by_viewer"],
        edgeFollow: EdgeFollowClass.fromJson(json["edge_follow"]),
        followsViewer: json["follows_viewer"],
        fullName: json["full_name"],
        groupMetadata: json["group_metadata"],
        hasArEffects: json["has_ar_effects"],
        hasClips: json["has_clips"],
        hasGuides: json["has_guides"],
        hasChannel: json["has_channel"],
        hasBlockedViewer: json["has_blocked_viewer"],
        highlightReelCount: json["highlight_reel_count"],
        hasRequestedViewer: json["has_requested_viewer"],
        hideLikeAndViewCounts: json["hide_like_and_view_counts"],
        id: json["id"],
        isBusinessAccount: json["is_business_account"],
        isProfessionalAccount: json["is_professional_account"],
        isSupervisionEnabled: json["is_supervision_enabled"],
        isGuardianOfViewer: json["is_guardian_of_viewer"],
        isSupervisedByViewer: json["is_supervised_by_viewer"],
        isSupervisedUser: json["is_supervised_user"],
        isEmbedsDisabled: json["is_embeds_disabled"],
        isJoinedRecently: json["is_joined_recently"],
        guardianId: json["guardian_id"],
        businessAddressJson: json["business_address_json"],
        businessContactMethod: json["business_contact_method"],
        businessEmail: json["business_email"],
        businessPhoneNumber: json["business_phone_number"],
        businessCategoryName: json["business_category_name"],
        overallCategoryName: json["overall_category_name"],
        categoryEnum: json["category_enum"],
        categoryName: json["category_name"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        isVerifiedByMv4B: json["is_verified_by_mv4b"],
        isRegulatedC18: json["is_regulated_c18"],
        edgeMutualFollowedBy:
            EdgeMutualFollowedBy.fromJson(json["edge_mutual_followed_by"]),
        pinnedChannelsListCount: json["pinned_channels_list_count"],
        profilePicUrl: json["profile_pic_url"],
        profilePicUrlHd: json["profile_pic_url_hd"],
        requestedByViewer: json["requested_by_viewer"],
        shouldShowCategory: json["should_show_category"],
        shouldShowPublicContacts: json["should_show_public_contacts"],
        showAccountTransparencyDetails:
            json["show_account_transparency_details"],
        transparencyLabel: json["transparency_label"],
        transparencyProduct: json["transparency_product"],
        username: usernameValues.map[json["username"]],
        connectedFbPage: json["connected_fb_page"],
        pronouns: List<dynamic>.from(json["pronouns"].map((x) => x)),
        edgeFelixVideoTimeline: EdgeFelixVideoTimelineClass.fromJson(
            json["edge_felix_video_timeline"]),
        edgeOwnerToTimelineMedia: EdgeFelixVideoTimelineClass.fromJson(
            json["edge_owner_to_timeline_media"]),
        edgeSavedMedia:
            EdgeFelixVideoTimelineClass.fromJson(json["edge_saved_media"]),
        edgeMediaCollections: EdgeFelixVideoTimelineClass.fromJson(
            json["edge_media_collections"]),
      );

  Map<String, dynamic> toJson() => {
        "biography": biography,
        "bio_links": List<dynamic>.from(bioLinks.map((x) => x.toJson())),
        "fb_profile_biolink": fbProfileBiolink,
        "biography_with_entities": biographyWithEntities?.toJson(),
        "blocked_by_viewer": blockedByViewer,
        "restricted_by_viewer": restrictedByViewer,
        "country_block": countryBlock,
        "eimu_id": eimuId,
        "external_url": externalUrl,
        "external_url_linkshimmed": externalUrlLinkshimmed,
        "edge_followed_by": edgeFollowedBy?.toJson(),
        "fbid": fbid,
        "followed_by_viewer": followedByViewer,
        "edge_follow": edgeFollow?.toJson(),
        "follows_viewer": followsViewer,
        "full_name": fullName,
        "group_metadata": groupMetadata,
        "has_ar_effects": hasArEffects,
        "has_clips": hasClips,
        "has_guides": hasGuides,
        "has_channel": hasChannel,
        "has_blocked_viewer": hasBlockedViewer,
        "highlight_reel_count": highlightReelCount,
        "has_requested_viewer": hasRequestedViewer,
        "hide_like_and_view_counts": hideLikeAndViewCounts,
        "id": id,
        "is_business_account": isBusinessAccount,
        "is_professional_account": isProfessionalAccount,
        "is_supervision_enabled": isSupervisionEnabled,
        "is_guardian_of_viewer": isGuardianOfViewer,
        "is_supervised_by_viewer": isSupervisedByViewer,
        "is_supervised_user": isSupervisedUser,
        "is_embeds_disabled": isEmbedsDisabled,
        "is_joined_recently": isJoinedRecently,
        "guardian_id": guardianId,
        "business_address_json": businessAddressJson,
        "business_contact_method": businessContactMethod,
        "business_email": businessEmail,
        "business_phone_number": businessPhoneNumber,
        "business_category_name": businessCategoryName,
        "overall_category_name": overallCategoryName,
        "category_enum": categoryEnum,
        "category_name": categoryName,
        "is_private": isPrivate,
        "is_verified": isVerified,
        "is_verified_by_mv4b": isVerifiedByMv4B,
        "is_regulated_c18": isRegulatedC18,
        "edge_mutual_followed_by": edgeMutualFollowedBy?.toJson(),
        "pinned_channels_list_count": pinnedChannelsListCount,
        "profile_pic_url": profilePicUrl,
        "profile_pic_url_hd": profilePicUrlHd,
        "requested_by_viewer": requestedByViewer,
        "should_show_category": shouldShowCategory,
        "should_show_public_contacts": shouldShowPublicContacts,
        "show_account_transparency_details": showAccountTransparencyDetails,
        "transparency_label": transparencyLabel,
        "transparency_product": transparencyProduct,
        "username": usernameValues.reverse[username],
        "connected_fb_page": connectedFbPage,
        "pronouns": List<dynamic>.from(pronouns.map((x) => x)),
        "edge_felix_video_timeline": edgeFelixVideoTimeline?.toJson(),
        "edge_owner_to_timeline_media": edgeOwnerToTimelineMedia?.toJson(),
        "edge_saved_media": edgeSavedMedia?.toJson(),
        "edge_media_collections": edgeMediaCollections?.toJson(),
      };
}

class BioLink {
  String title;
  String lynxUrl;
  String url;
  String linkType;

  BioLink({
    required this.title,
    required this.lynxUrl,
    required this.url,
    required this.linkType,
  });

  factory BioLink.fromJson(Map<String, dynamic> json) => BioLink(
        title: json["title"],
        lynxUrl: json["lynx_url"],
        url: json["url"],
        linkType: json["link_type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "lynx_url": lynxUrl,
        "url": url,
        "link_type": linkType,
      };
}

class BiographyWithEntities {
  String rawText;
  List<dynamic> entities;

  BiographyWithEntities({
    required this.rawText,
    required this.entities,
  });

  factory BiographyWithEntities.fromJson(Map<String, dynamic> json) =>
      BiographyWithEntities(
        rawText: json["raw_text"],
        entities: List<dynamic>.from(json["entities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "raw_text": rawText,
        "entities": List<dynamic>.from(entities.map((x) => x)),
      };
}

class EdgeFelixVideoTimelineClass {
  int count;
  PageInfo? pageInfo;
  List<EdgeFelixVideoTimelineEdge> edges;

  EdgeFelixVideoTimelineClass({
    required this.count,
    required this.pageInfo,
    required this.edges,
  });

  factory EdgeFelixVideoTimelineClass.fromJson(Map<String, dynamic> json) =>
      EdgeFelixVideoTimelineClass(
        count: json["count"],
        pageInfo: PageInfo.fromJson(json["page_info"]),
        edges: List<EdgeFelixVideoTimelineEdge>.from(
            json["edges"].map((x) => EdgeFelixVideoTimelineEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "page_info": pageInfo?.toJson(),
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeFelixVideoTimelineEdge {
  PurpleNode? node;

  EdgeFelixVideoTimelineEdge({
    required this.node,
  });

  factory EdgeFelixVideoTimelineEdge.fromJson(Map<String, dynamic> json) =>
      EdgeFelixVideoTimelineEdge(
        node: PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class PurpleNode {
  Typename typename;
  String id;
  String? shortcode;
  Dimensions dimensions;
  String? displayUrl;
  EdgeMediaTo edgeMediaToTaggedUser;
  dynamic factCheckOverallRating;
  dynamic factCheckInformation;
  dynamic gatingInfo;
  SharingFrictionInfo sharingFrictionInfo;
  dynamic mediaOverlayInfo;
  String? mediaPreview;
  Owner owner;
  bool? isVideo;
  bool? hasUpcomingEvent;
  String? accessibilityCaption;
  DashInfo? dashInfo;
  bool? hasAudio;
  String? trackingToken;
  String? videoUrl;
  int? videoViewCount;
  EdgeMediaTo edgeMediaToCaption;
  EdgeFollowClass edgeMediaToComment;
  bool? commentsDisabled;
  int takenAtTimestamp;
  EdgeFollowClass edgeLikedBy;
  EdgeFollowClass edgeMediaPreviewLike;
  dynamic location;
  dynamic nftAssetInfo;
  String? thumbnailSrc;
  List<ThumbnailResource> thumbnailResources;
  dynamic felixProfileGridCrop;
  List<dynamic> coauthorProducers;
  List<PinnedForUser> pinnedForUsers;
  bool? viewerCanReshare;
  dynamic encodingStatus;
  bool? isPublished;
  ProductType? productType;
  String? title;
  double? videoDuration;
  ClipsMusicAttributionInfo? clipsMusicAttributionInfo;
  EdgeSidecarToChildren? edgeSidecarToChildren;

  PurpleNode({
    required this.typename,
    required this.id,
    required this.shortcode,
    required this.dimensions,
    required this.displayUrl,
    required this.edgeMediaToTaggedUser,
    required this.factCheckOverallRating,
    required this.factCheckInformation,
    required this.gatingInfo,
    required this.sharingFrictionInfo,
    required this.mediaOverlayInfo,
    required this.mediaPreview,
    required this.owner,
    required this.isVideo,
    required this.hasUpcomingEvent,
    required this.accessibilityCaption,
    this.dashInfo,
    this.hasAudio,
    this.trackingToken,
    this.videoUrl,
    this.videoViewCount,
    required this.edgeMediaToCaption,
    required this.edgeMediaToComment,
    required this.commentsDisabled,
    required this.takenAtTimestamp,
    required this.edgeLikedBy,
    required this.edgeMediaPreviewLike,
    required this.location,
    required this.nftAssetInfo,
    required this.thumbnailSrc,
    required this.thumbnailResources,
    this.felixProfileGridCrop,
    required this.coauthorProducers,
    required this.pinnedForUsers,
    required this.viewerCanReshare,
    this.encodingStatus,
    this.isPublished,
    this.productType,
    this.title,
    this.videoDuration,
    this.clipsMusicAttributionInfo,
    this.edgeSidecarToChildren,
  });

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        typename: typenameValues.map[json["__typename"]]!,
        id: json["id"],
        shortcode: json["shortcode"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"],
        edgeMediaToTaggedUser:
            EdgeMediaTo.fromJson(json["edge_media_to_tagged_user"]),
        factCheckOverallRating: json["fact_check_overall_rating"],
        factCheckInformation: json["fact_check_information"],
        gatingInfo: json["gating_info"],
        sharingFrictionInfo:
            SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        mediaOverlayInfo: json["media_overlay_info"],
        mediaPreview: json["media_preview"],
        owner: Owner.fromJson(json["owner"]),
        isVideo: json["is_video"],
        hasUpcomingEvent: json["has_upcoming_event"],
        accessibilityCaption: json["accessibility_caption"],
        dashInfo: json["dash_info"] == null
            ? null
            : DashInfo.fromJson(json["dash_info"]),
        hasAudio: json["has_audio"],
        trackingToken: json["tracking_token"],
        videoUrl: json["video_url"],
        videoViewCount: json["video_view_count"],
        edgeMediaToCaption: EdgeMediaTo.fromJson(json["edge_media_to_caption"]),
        edgeMediaToComment:
            EdgeFollowClass.fromJson(json["edge_media_to_comment"]),
        commentsDisabled: json["comments_disabled"],
        takenAtTimestamp: json["taken_at_timestamp"],
        edgeLikedBy: EdgeFollowClass.fromJson(json["edge_liked_by"]),
        edgeMediaPreviewLike:
            EdgeFollowClass.fromJson(json["edge_media_preview_like"]),
        location: json["location"],
        nftAssetInfo: json["nft_asset_info"],
        thumbnailSrc: json["thumbnail_src"],
        thumbnailResources: List<ThumbnailResource>.from(
            json["thumbnail_resources"]
                .map((x) => ThumbnailResource.fromJson(x))),
        felixProfileGridCrop: json["felix_profile_grid_crop"],
        coauthorProducers:
            List<dynamic>.from(json["coauthor_producers"].map((x) => x)),
        pinnedForUsers: List<PinnedForUser>.from(
            json["pinned_for_users"].map((x) => PinnedForUser.fromJson(x))),
        viewerCanReshare: json["viewer_can_reshare"],
        encodingStatus: json["encoding_status"],
        isPublished: json["is_published"],
        productType: productTypeValues.map[json["product_type"]],
        title: json["title"],
        videoDuration: json["video_duration"]?.toDouble(),
        clipsMusicAttributionInfo: json["clips_music_attribution_info"] == null
            ? null
            : ClipsMusicAttributionInfo.fromJson(
                json["clips_music_attribution_info"]),
        edgeSidecarToChildren: json["edge_sidecar_to_children"] == null
            ? null
            : EdgeSidecarToChildren.fromJson(json["edge_sidecar_to_children"]),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typenameValues.reverse[typename],
        "id": id,
        "shortcode": shortcode,
        "dimensions": dimensions.toJson(),
        "display_url": displayUrl,
        "edge_media_to_tagged_user": edgeMediaToTaggedUser.toJson(),
        "fact_check_overall_rating": factCheckOverallRating,
        "fact_check_information": factCheckInformation,
        "gating_info": gatingInfo,
        "sharing_friction_info": sharingFrictionInfo.toJson(),
        "media_overlay_info": mediaOverlayInfo,
        "media_preview": mediaPreview,
        "owner": owner.toJson(),
        "is_video": isVideo,
        "has_upcoming_event": hasUpcomingEvent,
        "accessibility_caption": accessibilityCaption,
        "dash_info": dashInfo?.toJson(),
        "has_audio": hasAudio,
        "tracking_token": trackingToken,
        "video_url": videoUrl,
        "video_view_count": videoViewCount,
        "edge_media_to_caption": edgeMediaToCaption.toJson(),
        "edge_media_to_comment": edgeMediaToComment.toJson(),
        "comments_disabled": commentsDisabled,
        "taken_at_timestamp": takenAtTimestamp,
        "edge_liked_by": edgeLikedBy.toJson(),
        "edge_media_preview_like": edgeMediaPreviewLike.toJson(),
        "location": location,
        "nft_asset_info": nftAssetInfo,
        "thumbnail_src": thumbnailSrc,
        "thumbnail_resources":
            List<dynamic>.from(thumbnailResources.map((x) => x.toJson())),
        "felix_profile_grid_crop": felixProfileGridCrop,
        "coauthor_producers":
            List<dynamic>.from(coauthorProducers.map((x) => x)),
        "pinned_for_users":
            List<dynamic>.from(pinnedForUsers.map((x) => x.toJson())),
        "viewer_can_reshare": viewerCanReshare,
        "encoding_status": encodingStatus,
        "is_published": isPublished,
        "product_type": productTypeValues.reverse[productType],
        "title": title,
        "video_duration": videoDuration,
        "clips_music_attribution_info": clipsMusicAttributionInfo?.toJson(),
        "edge_sidecar_to_children": edgeSidecarToChildren?.toJson(),
      };
}

class ClipsMusicAttributionInfo {
  String artistName;
  String songName;
  bool usesOriginalAudio;
  bool shouldMuteAudio;
  String shouldMuteAudioReason;
  String audioId;

  ClipsMusicAttributionInfo({
    required this.artistName,
    required this.songName,
    required this.usesOriginalAudio,
    required this.shouldMuteAudio,
    required this.shouldMuteAudioReason,
    required this.audioId,
  });

  factory ClipsMusicAttributionInfo.fromJson(Map<String, dynamic> json) =>
      ClipsMusicAttributionInfo(
        artistName: json["artist_name"],
        songName: json["song_name"],
        usesOriginalAudio: json["uses_original_audio"],
        shouldMuteAudio: json["should_mute_audio"],
        shouldMuteAudioReason: json["should_mute_audio_reason"],
        audioId: json["audio_id"],
      );

  Map<String, dynamic> toJson() => {
        "artist_name": artistName,
        "song_name": songName,
        "uses_original_audio": usesOriginalAudio,
        "should_mute_audio": shouldMuteAudio,
        "should_mute_audio_reason": shouldMuteAudioReason,
        "audio_id": audioId,
      };
}

class DashInfo {
  bool isDashEligible;
  String? videoDashManifest;
  int numberOfQualities;

  DashInfo({
    required this.isDashEligible,
    required this.videoDashManifest,
    required this.numberOfQualities,
  });

  factory DashInfo.fromJson(Map<String, dynamic> json) => DashInfo(
        isDashEligible: json["is_dash_eligible"],
        videoDashManifest: json["video_dash_manifest"],
        numberOfQualities: json["number_of_qualities"],
      );

  Map<String, dynamic> toJson() => {
        "is_dash_eligible": isDashEligible,
        "video_dash_manifest": videoDashManifest,
        "number_of_qualities": numberOfQualities,
      };
}

class Dimensions {
  int height;
  int width;

  Dimensions({
    required this.height,
    required this.width,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
      };
}

class EdgeFollowClass {
  int count;

  EdgeFollowClass({
    required this.count,
  });

  factory EdgeFollowClass.fromJson(Map<String, dynamic> json) =>
      EdgeFollowClass(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class EdgeMediaTo {
  List<EdgeMediaToCaptionEdge> edges;

  EdgeMediaTo({
    required this.edges,
  });

  factory EdgeMediaTo.fromJson(Map<String, dynamic> json) => EdgeMediaTo(
        edges: List<EdgeMediaToCaptionEdge>.from(
            json["edges"].map((x) => EdgeMediaToCaptionEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeMediaToCaptionEdge {
  FluffyNode node;

  EdgeMediaToCaptionEdge({
    required this.node,
  });

  factory EdgeMediaToCaptionEdge.fromJson(Map<String, dynamic> json) =>
      EdgeMediaToCaptionEdge(
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class FluffyNode {
  String? text;

  FluffyNode({
    required this.text,
  });

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class EdgeSidecarToChildren {
  List<EdgeSidecarToChildrenEdge> edges;

  EdgeSidecarToChildren({
    required this.edges,
  });

  factory EdgeSidecarToChildren.fromJson(Map<String, dynamic> json) =>
      EdgeSidecarToChildren(
        edges: List<EdgeSidecarToChildrenEdge>.from(
            json["edges"].map((x) => EdgeSidecarToChildrenEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeSidecarToChildrenEdge {
  TentacledNode? node;

  EdgeSidecarToChildrenEdge({
    required this.node,
  });

  factory EdgeSidecarToChildrenEdge.fromJson(Map<String, dynamic> json) =>
      EdgeSidecarToChildrenEdge(
        node: TentacledNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class TentacledNode {
  Typename typename;
  String? id;
  String? shortcode;
  Dimensions dimensions;
  String? displayUrl;
  EdgeMediaTo? edgeMediaToTaggedUser;
  dynamic factCheckOverallRating;
  dynamic factCheckInformation;
  dynamic gatingInfo;
  SharingFrictionInfo? sharingFrictionInfo;
  dynamic mediaOverlayInfo;
  String? mediaPreview;
  Owner owner;
  bool isVideo;
  bool hasUpcomingEvent;
  String? accessibilityCaption;

  TentacledNode({
    required this.typename,
    required this.id,
    required this.shortcode,
    required this.dimensions,
    required this.displayUrl,
    required this.edgeMediaToTaggedUser,
    required this.factCheckOverallRating,
    required this.factCheckInformation,
    required this.gatingInfo,
    required this.sharingFrictionInfo,
    required this.mediaOverlayInfo,
    required this.mediaPreview,
    required this.owner,
    required this.isVideo,
    required this.hasUpcomingEvent,
    required this.accessibilityCaption,
  });

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        typename: typenameValues.map[json["__typename"]]!,
        id: json["id"],
        shortcode: json["shortcode"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"],
        edgeMediaToTaggedUser:
            EdgeMediaTo.fromJson(json["edge_media_to_tagged_user"]),
        factCheckOverallRating: json["fact_check_overall_rating"],
        factCheckInformation: json["fact_check_information"],
        gatingInfo: json["gating_info"],
        sharingFrictionInfo:
            SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        mediaOverlayInfo: json["media_overlay_info"],
        mediaPreview: json["media_preview"],
        owner: Owner.fromJson(json["owner"]),
        isVideo: json["is_video"],
        hasUpcomingEvent: json["has_upcoming_event"],
        accessibilityCaption: json["accessibility_caption"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typenameValues.reverse[typename],
        "id": id,
        "shortcode": shortcode,
        "dimensions": dimensions.toJson(),
        "display_url": displayUrl,
        "edge_media_to_tagged_user": edgeMediaToTaggedUser?.toJson(),
        "fact_check_overall_rating": factCheckOverallRating,
        "fact_check_information": factCheckInformation,
        "gating_info": gatingInfo,
        "sharing_friction_info": sharingFrictionInfo?.toJson(),
        "media_overlay_info": mediaOverlayInfo,
        "media_preview": mediaPreview,
        "owner": owner.toJson(),
        "is_video": isVideo,
        "has_upcoming_event": hasUpcomingEvent,
        "accessibility_caption": accessibilityCaption,
      };
}

class Owner {
  String? id;
  Username? username;

  Owner({
    required this.id,
    required this.username,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        username: usernameValues.map[json["username"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": usernameValues.reverse[username],
      };
}

enum Username { GENSHINLIF3 }

final usernameValues = EnumValues({"genshinlif3": Username.GENSHINLIF3});

class SharingFrictionInfo {
  bool shouldHaveSharingFriction;
  dynamic bloksAppUrl;

  SharingFrictionInfo({
    required this.shouldHaveSharingFriction,
    required this.bloksAppUrl,
  });

  factory SharingFrictionInfo.fromJson(Map<String, dynamic> json) =>
      SharingFrictionInfo(
        shouldHaveSharingFriction: json["should_have_sharing_friction"],
        bloksAppUrl: json["bloks_app_url"],
      );

  Map<String, dynamic> toJson() => {
        "should_have_sharing_friction": shouldHaveSharingFriction,
        "bloks_app_url": bloksAppUrl,
      };
}

enum Typename { GRAPH_IMAGE, GRAPH_SIDECAR, GRAPH_VIDEO }

final typenameValues = EnumValues({
  "GraphImage": Typename.GRAPH_IMAGE,
  "GraphSidecar": Typename.GRAPH_SIDECAR,
  "GraphVideo": Typename.GRAPH_VIDEO
});

class PinnedForUser {
  String? id;
  bool isVerified;
  String? profilePicUrl;
  Username? username;

  PinnedForUser({
    required this.id,
    required this.isVerified,
    required this.profilePicUrl,
    required this.username,
  });

  factory PinnedForUser.fromJson(Map<String, dynamic> json) => PinnedForUser(
        id: json["id"],
        isVerified: json["is_verified"],
        profilePicUrl: json["profile_pic_url"],
        username: usernameValues.map[json["username"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_verified": isVerified,
        "profile_pic_url": profilePicUrl,
        "username": usernameValues.reverse[username],
      };
}

enum ProductType { CLIPS, FEED, IGTV }

final productTypeValues = EnumValues({
  "clips": ProductType.CLIPS,
  "feed": ProductType.FEED,
  "igtv": ProductType.IGTV
});

class ThumbnailResource {
  String? src;
  int configWidth;
  int configHeight;

  ThumbnailResource({
    required this.src,
    required this.configWidth,
    required this.configHeight,
  });

  factory ThumbnailResource.fromJson(Map<String, dynamic> json) =>
      ThumbnailResource(
        src: json["src"],
        configWidth: json["config_width"],
        configHeight: json["config_height"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
        "config_width": configWidth,
        "config_height": configHeight,
      };
}

class PageInfo {
  bool hasNextPage;
  String? endCursor;

  PageInfo({
    required this.hasNextPage,
    required this.endCursor,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        hasNextPage: json["has_next_page"],
        endCursor: json["end_cursor"],
      );

  Map<String, dynamic> toJson() => {
        "has_next_page": hasNextPage,
        "end_cursor": endCursor,
      };
}

class EdgeMutualFollowedBy {
  int count;
  List<dynamic> edges;

  EdgeMutualFollowedBy({
    required this.count,
    required this.edges,
  });

  factory EdgeMutualFollowedBy.fromJson(Map<String, dynamic> json) =>
      EdgeMutualFollowedBy(
        count: json["count"],
        edges: List<dynamic>.from(json["edges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "edges": List<dynamic>.from(edges.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
