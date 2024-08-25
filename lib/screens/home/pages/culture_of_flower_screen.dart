import 'package:flutter/material.dart';
import 'article_screen.dart';

class CultureOfFlowerScreen extends StatelessWidget {
  const CultureOfFlowerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        backgroundColor: const Color(0xffacd4b2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Culture of Flowers', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFlowerCard(
                context,
                imageUrls: [
                  "https://i.pinimg.com/564x/d9/78/60/d97860452b8f11960124aa55a2d5f9ea.jpg",
                  "https://i.pinimg.com/564x/4a/8a/0f/4a8a0f2690ac480cae2ab6796ac628fc.jpg",
                  "https://i.pinimg.com/564x/af/40/0c/af400c6bf04c9aa414420ba197d3592d.jpg",
                  "https://i.pinimg.com/564x/06/ce/95/06ce959c2599ea7483232af325539472.jpg"
                ],
                title: "Jasmine (The innocent flower)",
                description: "Short description of jasmine or preview of inner articles to attract user to click this contents",
                author: "Article by (Name)",
                content: "    The jasmine flower, with its delicate white or yellow petals and sweet, intoxicating fragrance, is a beloved symbol of purity, love, and elegance across various cultures. Often used in religious ceremonies and traditional garlands, jasmine blooms are celebrated not only for their aesthetic appeal but also for their role in perfumes and teas. Thriving in warm climates, this evergreen plant is cherished for its ease of cultivation and its ability to bring a touch of natural beauty and soothing aroma to gardens and homes.",
              ),
              const SizedBox(height: 16),
              _buildFlowerCard(
                context,
                imageUrls: [
                  "https://i.pinimg.com/736x/62/8a/84/628a84a884e3893c74cac15d76e869e6.jpg",
                  "https://i.pinimg.com/564x/3c/e4/55/3ce4555687e8e085dce6145386fb88c9.jpg",
                  "https://i.pinimg.com/564x/08/5a/8e/085a8ee21ed03c39bd2e9c509b425b7e.jpg",
                  "https://i.pinimg.com/564x/c5/d8/2d/c5d82d0417f77e8e3da47d1703fbab48.jpg",
                ],
                title: "Lotus (purity, rebirth, and strength)",
                description: "Short description of lotus or preview of inner articles to attract user to click this contents",
                author: "Article by (Name)",
                content: "    The lotus flower, with its striking blooms and serene symbolism, is a powerful symbol of purity, enlightenment, and rebirth in many cultures. Emerging from muddy waters, the lotus represents the ability to rise above challenges and achieve spiritual growth. In Hinduism and Buddhism, the lotus is revered as a sacred flower associated with divine beauty and spiritual awakening. Its large, fragrant blossoms come in various colors, including white, pink, and blue, each carrying its own symbolic meaning. Thriving in waterlogged environments, the lotus plant is admired for its resilience and its ability to bloom with exceptional grace and beauty.",
              ),
              const SizedBox(height: 16),
              _buildFlowerCard(
                context,
                imageUrls: [
                  "https://i.pinimg.com/564x/23/29/b3/2329b3b01069a4f1ff4182062dd5929a.jpg",
                  "https://i.pinimg.com/564x/27/c0/1a/27c01aef20c69459f52526f55e11032d.jpg",
                  "https://i.pinimg.com/564x/b9/a0/f1/b9a0f1fc1831fa0c2b250530cc81f579.jpg",
                  "https://i.pinimg.com/564x/c1/c5/e2/c1c5e2e7733de91357db56792e769222.jpg",
                ],
                title: "Flower Festivals",
                description: "Short description of flower festivals or preview of inner articles to attract user to click this contents",
                author: "Article by (Name)",
                content: "    Flower festivals are vibrant celebrations that showcase the beauty and diversity of flowers, often marking seasonal changes or cultural traditions. These festivals typically feature stunning floral displays, parades, and artistic exhibits that highlight the intricate and colorful world of flowers. One of the most famous flower festivals is the Keukenhof Flower Festival in the Netherlands, held annually in the spring. It is renowned for its vast fields of tulips, daffodils, and hyacinths, creating a breathtaking display of color and design. Another notable event is the Rose Parade in Pasadena, California, which takes place on New Year's Day and features elaborate floats adorned with thousands of roses and other flowers.",
              ),
              const SizedBox(height: 16),
              _buildFlowerCard(
                context,
                imageUrls: [
                  "https://i.pinimg.com/564x/bd/ff/5c/bdff5cdd3599e45be82706f631c2fa28.jpg",
                  "https://i.pinimg.com/564x/da/bb/3f/dabb3fad720d037029b69857748d080b.jpg",
                  "https://i.pinimg.com/564x/23/15/b1/2315b1b3ae6530dfed36276325e6c127.jpg",
                  "https://i.pinimg.com/564x/48/58/3b/48583b2e7b43db5a8a97787ba64f589d.jpg",
                ],
                title: "Flower Arrangements",
                description: "Short description of flower arrangements or preview of inner articles to attract user to click this contents",
                author: "Article by (Name)",
                content: "    Flower arrangements are an elegant art form that brings together the beauty of fresh blooms into stunning displays for various occasions. From traditional bouquets with classic symmetry to modern designs featuring bold, minimalist elements, each arrangement reflects a unique style and sentiment. Whether creating a rustic country look with wildflowers or crafting a serene Japanese ikebana arrangement, flower arrangements enhance any setting with their color, form, and emotional impact. They not only beautify spaces but also convey messages of celebration, love, and appreciation.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlowerCard(
      BuildContext context, {
        required List<String> imageUrls,
        required String title,
        required String description,
        required String author,
        required String content,
      }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticleScreen(
            imageUrls: imageUrls,
            title: title,
            content: content,
            author: author,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrls[0],
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
