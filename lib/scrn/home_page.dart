import 'dart:async';
import 'package:intl/intl.dart';

import 'package:esports_news/model/info_model.dart';
import 'package:esports_news/service/api_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();

  // late Timer timer;
  // int counter = 0;

  // List<List<ApiModelRecentSearch>> api = [];
  // late Box datas;

  // @override
  // void initState() {
  //   super.initState();
  //   datas = Hive.box(boxName);
  //   print('datas: ${datas.values}');
  // }

  // Constants constants = Constants();
  // List data = [];

  // Future<List<ApiModelRecentSearch>>? _future;

  // @override
  // void initState() {
  //   super.initState();
  //   setUpTimedFetch();
  // }

  // setUpTimedFetch() {
  //   Timer.periodic(const Duration(seconds: 10), (timer) {
  //     setState(() {
  //       _future = apiService.getAllData();
  //     });
  //   });
  // }

  String currentHour = DateTime.now().hour.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apex Legends'),
      ),
      body: FutureBuilder<List<ApiModelRecentSearch>>(
          future: apiService.getAllData(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            snapshot.data![index].includes!.users!.length,
                        itemBuilder: ((context, index1) {
                          return
                              // snapshot.data![index].data![index1]
                              //             .publicMetrics!.likeCount! >
                              //         1
                              //     ?
                              Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(index1.toString()),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 17,
                                        backgroundImage: NetworkImage(snapshot
                                            .data![index]
                                            .includes!
                                            .users![index1]
                                            .profileImageUrl!),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        snapshot.data![index].includes!
                                            .users![index1].name!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      // const SizedBox(
                                      //   width: 8,
                                      // ),
                                      // Text(
                                      //   (DateFormat('h').format(
                                      //     DateTime.parse(snapshot.data![index]
                                      //         .data![index1].createdAt!),
                                      //   )),
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(snapshot
                                      .data![index].data![index1].text!),
                                  Text(snapshot
                                      .data![index].data![index1].lang!),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.message_rounded),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              // if (snapshot
                                              //         .data![index]
                                              //         .data![index1]
                                              //         .referencedTweets![
                                              //             index]
                                              //         .type ==
                                              //     'retweeted')
                                              Text(
                                                  // snapshot
                                                  //             .data![index]
                                                  //             .data![index]
                                                  //             .referencedTweets![
                                                  //                 index]
                                                  //             .type ==
                                                  //         "retweeted"
                                                  //     ?
                                                  snapshot
                                                      .data![index]
                                                      .data![index1]
                                                      .publicMetrics!
                                                      .replyCount!
                                                      .toString()
                                                  //     :
                                                  // snapshot
                                                  //     .data![index]
                                                  //     .data![index1]
                                                  //     .publicMetrics!
                                                  //     .replyCount
                                                  //     .toString(),
                                                  ),
                                            ],
                                          ),
                                          // const SizedBox(
                                          //   width: 20,
                                          // ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.heart_broken_rounded),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                  // snapshot
                                                  //             .data![index]
                                                  //             .data![index]
                                                  //             .referencedTweets![
                                                  //                 index]
                                                  //             .type ==
                                                  //         "retweeted"
                                                  //     ?
                                                  snapshot
                                                      .data![index]
                                                      .data![index1]
                                                      .publicMetrics!
                                                      .likeCount!
                                                      .toString()
                                                  //     :
                                                  // snapshot
                                                  //     .data![index]
                                                  //     .data![index1]
                                                  //     .publicMetrics!
                                                  //     .likeCount
                                                  //     .toString(),
                                                  ),
                                            ],
                                          ),
                                          // // const SizedBox(
                                          // //   width: 20,
                                          // // ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.reset_tv_rounded),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                snapshot
                                                    .data![index]
                                                    .data![index1]
                                                    .publicMetrics!
                                                    .retweetCount!
                                                    .toString(),
                                                // snapshot
                                                //     .data![index]
                                                //     .data![index1]
                                                //     .publicMetrics!
                                                //     .retweetCount
                                                //     .toString(),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Link(
                                        target: LinkTarget.blank,
                                        uri: Uri.parse(
                                            'https://twitter.com/${snapshot.data![index].includes!.users![index].username}/status/${snapshot.data![index].data![index1].id!}'),
                                        builder: (context, followLink) =>
                                            TextButton(
                                          onPressed: followLink,
                                          child: const Text('go to the tweet'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                          // : Container();
                        }));
                  }));
            }
            return const Center(child: CircularProgressIndicator());
          })),
    );
  }
}
