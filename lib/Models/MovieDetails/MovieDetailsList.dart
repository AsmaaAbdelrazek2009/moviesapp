class MoviesDetailsApiResponse {
  final String status;
  final String statusMessage;
  final Data? data;
  final Meta? meta;

  MoviesDetailsApiResponse({
    required this.status,
    required this.statusMessage,
    this.data,
    this.meta,
  });

  factory MoviesDetailsApiResponse.fromJson(Map<String, dynamic> json) {
    return MoviesDetailsApiResponse(
      status: json['status'] as String,
      statusMessage: json['status_message'] as String,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      meta: json['@meta'] != null ? Meta.fromJson(json['@meta']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_message': statusMessage,
      'data': data?.toJson(),
      '@meta': meta?.toJson(),
    };
  }
}

class Data {
  final Movie2? movie;

  Data({this.movie});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      movie: json['movie'] != null ? Movie2.fromJson(json['movie']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movie': movie?.toJson(),
    };
  }
}

class Movie2 {
  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final int likeCount;
  final String descriptionIntro;
  final String descriptionFull;
  final String? ytTrailerCode;
  final String language;
  final String? mpaRating;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final List<Torrent> torrents;
  final String dateUploaded;
  final int dateUploadedUnix;

  Movie2({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    this.ytTrailerCode,
    required this.language,
    this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Movie2.fromJson(Map<String, dynamic> json) {
    return Movie2(
      id: json['id'] as int,
      url: json['url'] as String,
      imdbCode: json['imdb_code'] as String,
      title: json['title'] as String,
      titleEnglish: json['title_english'] as String,
      titleLong: json['title_long'] as String,
      slug: json['slug'] as String,
      year: json['year'] as int,
      rating: (json['rating'] as num).toDouble(),
      runtime: json['runtime'] as int,
      genres: List<String>.from(json['genres'] as List),
      likeCount: json['like_count'] as int,
      descriptionIntro: json['description_intro'] as String,
      descriptionFull: json['description_full'] as String,
      ytTrailerCode: json['yt_trailer_code'] as String?,
      language: json['language'] as String,
      mpaRating: json['mpa_rating'] as String?,
      backgroundImage: json['background_image'] as String,
      backgroundImageOriginal: json['background_image_original'] as String,
      smallCoverImage: json['small_cover_image'] as String,
      mediumCoverImage: json['medium_cover_image'] as String,
      largeCoverImage: json['large_cover_image'] as String,
      torrents: (json['torrents'] as List)
          .map((t) => Torrent.fromJson(t as Map<String, dynamic>))
          .toList(),
      dateUploaded: json['date_uploaded'] as String,
      dateUploadedUnix: json['date_uploaded_unix'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'imdb_code': imdbCode,
      'title': title,
      'title_english': titleEnglish,
      'title_long': titleLong,
      'slug': slug,
      'year': year,
      'rating': rating,
      'runtime': runtime,
      'genres': genres,
      'like_count': likeCount,
      'description_intro': descriptionIntro,
      'description_full': descriptionFull,
      'yt_trailer_code': ytTrailerCode,
      'language': language,
      'mpa_rating': mpaRating,
      'background_image': backgroundImage,
      'background_image_original': backgroundImageOriginal,
      'small_cover_image': smallCoverImage,
      'medium_cover_image': mediumCoverImage,
      'large_cover_image': largeCoverImage,
      'torrents': torrents.map((t) => t.toJson()).toList(),
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }
}

class Torrent {
  final String url;
  final String hash;
  final String quality;
  final String type;
  final String isRepack;
  final String videoCodec;
  final String bitDepth;
  final String audioChannels;
  final int seeds;
  final int peers;
  final String size;
  final int sizeBytes;
  final String dateUploaded;
  final int dateUploadedUnix;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return Torrent(
      url: json['url'] as String,
      hash: json['hash'] as String,
      quality: json['quality'] as String,
      type: json['type'] as String,
      isRepack: json['is_repack'] as String,
      videoCodec: json['video_codec'] as String,
      bitDepth: json['bit_depth'] as String,
      audioChannels: json['audio_channels'] as String,
      seeds: json['seeds'] as int,
      peers: json['peers'] as int,
      size: json['size'] as String,
      sizeBytes: json['size_bytes'] as int,
      dateUploaded: json['date_uploaded'] as String,
      dateUploadedUnix: json['date_uploaded_unix'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'hash': hash,
      'quality': quality,
      'type': type,
      'is_repack': isRepack,
      'video_codec': videoCodec,
      'bit_depth': bitDepth,
      'audio_channels': audioChannels,
      'seeds': seeds,
      'peers': peers,
      'size': size,
      'size_bytes': sizeBytes,
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }
}

class Meta {
  final int apiVersion;
  final String executionTime;

  Meta({
    required this.apiVersion,
    required this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      apiVersion: json['api_version'] as int,
      executionTime: json['execution_time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'api_version': apiVersion,
      'execution_time': executionTime,
    };
  }
}