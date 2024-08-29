import 'package:flutter/material.dart';

import 'cooking_ways_screen.dart';

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
                title: "Broccoli",
                description: "Short description of broccoli or preview of inner articles to attract user to click this contents",
                author: "Article by (Hein)",
                content: "  Preparation: Wash the broccoli and cut it into florets. Peel and chop the stems if you want to use them too. Blanching: Bring a pot of water to a boil, add salt, and blanch the broccoli florets for 2 minutes. Drain and transfer to ice water to keep them bright green. Sauté: In a pan, heat olive oil over medium heat. Add minced garlic and sauté for about 30 seconds. Add the blanched broccoli, season with salt and pepper, and sauté for another 3-5 minutes until tender. Optional: Squeeze lemon juice over the broccoli before serving for added flavor.",
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
                title: "Champak",
                description: "Short description of Champak or preview of inner articles to attract user to click this contents",
                author: "Article by (Hein)",
                content: "    Preparation: Rinse the petals of the champak flower thoroughly and pat dry. Sauté: Heat olive oil or butter in a pan. Add minced garlic and sauté for 1 minute. Cooking the Petals: Add the flower petals to the pan and lightly sauté for 2-3 minutes. Seasoning: Add a pinch of salt and a squeeze of lemon to enhance the flavor. Serve as a garnish or mix into salads.",
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
                title: "Coriander",
                description: "Short description of coriander or preview of inner articles to attract user to click this contents",
                author: "Article by (Hein)",
                content: "    Preparation: Wash the coriander leaves and chop them finely. Keep the stems if you want a more intense flavor. Sauté: Heat olive oil in a pan and add the minced garlic. Sauté for about 30 seconds until fragrant. Adding Coriander: Add the chopped coriander leaves and sauté for 1-2 minutes. The leaves should just wilt but remain bright green. Seasoning: Add a dash of lemon juice and salt to taste. Use as a garnish for dishes like grilled meats, soups, or salads.",
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
                title: "Grand Rapids",
                description: "Short description of Grand Rapids or preview of inner articles to attract user to click this contents",
                author: "Article by (Hein)",
                content: "    Preparation: Rinse the lettuce leaves thoroughly and pat dry. Tear the leaves into bite-sized pieces. Dressing: In a small bowl, whisk together olive oil, balsamic vinegar, salt, and pepper. Tossing: Toss the lettuce with the dressing right before serving to prevent wilting. Serving Suggestion: Add toppings like cherry tomatoes, cucumber slices, or nuts for extra texture and flavor.",
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
          builder: (context) => CookingWaysScreen(
            imagePaths: imageUrls,
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
              child: Image.asset(
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

