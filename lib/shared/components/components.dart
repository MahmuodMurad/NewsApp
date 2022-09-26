import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view.dart';

Widget buildArticleItem(BuildContext context, article) {
  var md=MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: article['url']),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: md.height*0.147,
                color: Theme.of(context).primaryColorDark,
                child: Container(
                  margin: EdgeInsets.only(left: md.width*0.342),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            vertical: md.height*0.005, horizontal: md.width*0.005),
                        child: Text(
                          '${article['title']}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                       SizedBox(
                        height: md.height*0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            '${article['publishedAt']}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  width: md.width*0.3,
                  height: md.height*0.147,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${(article['urlToImage']) == null ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png' : article['urlToImage']}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget myDivider() => (Container(
      height: 30,
    ));

Widget buildImageSlider(BuildContext context, List<dynamic> article) {
  var md=MediaQuery.of(context).size;
  int size = article.length;
  var element = List<int>.generate(size, (i) => i);

  return (Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       SizedBox(
        height: md.height*0.03,
      ),
      CarouselSlider(
        options: CarouselOptions(
          height: md.height*0.226,
          initialPage: 0,
          autoPlay: true,
          onPageChanged: (index, _) {},
          autoPlayInterval: const Duration(seconds: 3),
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
        items: element.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.network(
                        '${(article[i]['urlToImage']) == null ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png' : article[i]['urlToImage']}',
                        fit: BoxFit.fill,
                        width: 315,
                        height: 165,
                      ),
                    ),
                    Positioned(
                      top: 110,
                      child: Center(
                        child: Container(
                          width: 312,
                          height: 65,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(18.0),
                              bottomLeft: Radius.circular(18.0),
                            ),
                            color: Colors.black12,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '${article[i]['title']}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Text(
          'Latest News',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ));
}
