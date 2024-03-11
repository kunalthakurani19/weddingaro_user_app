// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class LazyLoadingVideo extends StatefulWidget {
//   final String videoUrl;
//   final double height;
//   final double width;

//   const LazyLoadingVideo({
//     Key? key,
//     required this.videoUrl,
//     this.height = 200.0, // Default height
//     this.width = double.infinity, // Default width
//   }) : super(key: key);

//   @override
//   _LazyLoadingVideoState createState() => _LazyLoadingVideoState();
// }

// class _LazyLoadingVideoState extends State<LazyLoadingVideo> {
//   VideoPlayerController? _controller;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer();
//   }

//   Future<void> _initializeVideoPlayer() async {
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {
//           _isLoading = false;
//         });
//       }).catchError((error) {
//         setState(() {
//           _isLoading = false;
//         });
//         // Handle error loading video
//       });
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return Container(
//         height: widget.height,
//         width: widget.width,
//         color: Colors.grey[200],
//         child: const Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     } else if (_controller?.value.isInitialized ?? false) {
//       return SizedBox(
//         height: widget.height,
//         width: widget.width,
//         child: VideoPlayer(_controller!),
//       );
//     } else {
//       return Container(
//         height: widget.height,
//         width: widget.width,
//         color: Colors.red,
//         child: const Center(
//           child: Icon(Icons.error),
//         ),
//       );
//     }
//   }
// }
