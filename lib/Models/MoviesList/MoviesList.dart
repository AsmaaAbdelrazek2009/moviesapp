class MovieResponse {
  final String status;
  final String statusMessage;
  final MovieData? data;

  MovieResponse({
    required this.status,
    required this.statusMessage,
    this.data,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: json['data'] != null ? MovieData.fromJson(json['data']) : null,
    );
  }
}

class MovieData {
  final int movieCount;
  final int limit;
  final int pageNumber;
  final List<Movie> movies;

  MovieData({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) {
    return MovieData(
      movieCount: json['movie_count'],
      limit: json['limit'],
      pageNumber: json['page_number'],
      movies: (json['movies'] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList(),
    );
  }
}

class Movie {
  final int? id;
  final String? url;
  final String? imdbCode;
  final String? title;
  final String? titleEnglish;
  final String? titleLong;
  final String? slug;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  final String? descriptionFull;
  final String? synopsis;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? backgroundImage;
  final String? mediumCoverImage;
  final List<Torrent>? torrents;
  final String? dateUploaded;

  Movie({
     this.id,
     this.url,
     this.imdbCode,
     this.title,
     this.titleEnglish,
     this.titleLong,
     this.slug,
     this.year,
     this.rating,
     this.runtime,
     this.genres,
     this.summary,
     this.descriptionFull,
     this.synopsis,
     this.ytTrailerCode,
     this.language,
     this.mpaRating,
     this.backgroundImage,
     this.mediumCoverImage,
     this.torrents,
     this.dateUploaded,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      url: json['url'],
      imdbCode: json['imdb_code'],
      title: json['title'],
      titleEnglish: json['title_english'],
      titleLong: json['title_long'],
      slug: json['slug'],
      year: json['year'],
      rating: (json['rating'] as num).toDouble(),
      runtime: json['runtime'],
      genres: List<String>.from(json['genres']),
      summary: json['summary'],
      descriptionFull: json['description_full'],
      synopsis: json['synopsis'],
      ytTrailerCode: json['yt_trailer_code'],
      language: json['language'],
      mpaRating: json['mpa_rating'],
      backgroundImage: json['background_image'],
      mediumCoverImage: json['medium_cover_image'],
      torrents: (json['torrents'] as List)
          .map((t) => Torrent.fromJson(t))
          .toList(),
      dateUploaded: json['date_uploaded'],
    );
  }
}

class Torrent {
  final String url;
  final String hash;
  final String quality;
  final String type;
  final int seeds;
  final int peers;
  final String size;
  final int sizeBytes;
  final String dateUploaded;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return Torrent(
      url: json['url'],
      hash: json['hash'],
      quality: json['quality'],
      type: json['type'],
      seeds: json['seeds'],
      peers: json['peers'],
      size: json['size'],
      sizeBytes: json['size_bytes'],
      dateUploaded: json['date_uploaded'],
    );
  }
}