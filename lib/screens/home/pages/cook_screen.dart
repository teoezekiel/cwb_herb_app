import 'package:flutter/material.dart';
import 'article_screen.dart';

class CookScreen extends StatelessWidget {
  const CookScreen({Key? key}) : super(key: key);

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
        title: const Text('How to cook', style: TextStyle(color: Colors.white)),
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
                  "assets/images/broccoli.jpg",
                  "assets/images/broccoli.jpg",
                  "assets/images/broccoli.jpg",
                  "assets/images/broccoli.jpg"
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
                  "assets/images/Champak.png",
                  "assets/images/Champak.png",
                  "assets/images/Champak.png",
                  "assets/images/Champak.png",
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
                  "assets/images/coriander.jpg",
                  "assets/images/coriander.jpg",
                  "assets/images/coriander.jpg",
                  "assets/images/coriander.jpg",
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
                  "assets/images/Grand_Rapids.jpg",
                  "assets/images/Grand_Rapids.jpg",
                  "assets/images/Grand_Rapids.jpg",
                  "assets/images/Grand_Rapids.jpg",
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

