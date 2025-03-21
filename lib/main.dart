import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: PowerpuffGirlsAboutPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class PowerpuffGirlsAboutPage extends StatelessWidget {
  const PowerpuffGirlsAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Powerpuff Girls'),
        backgroundColor: Colors.pink[100],
      ),
      body: const PowerpuffContent(),
    );
  }
}

class PowerpuffContent extends StatelessWidget {
  const PowerpuffContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeroBanner(),
          CharacterSection(),
          StorySection(),
          GenreSection(),
          EpisodesSection(),
          CreatorSection(),
        ],
      ),
    );
  }
}

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://threadheads.com/cdn/shop/files/Desktop_Banner_Powerpuff_Girls_af39b8e4-3900-42db-80bc-defec60dc7f5.jpg?v=1728531786&width=1800',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(16),
            child: const Text(
              'About The Series',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CharacterSection extends StatelessWidget {
  const CharacterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Main Characters',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CharacterCard(
                  name: 'Blossom',
                  color: Colors.pink,
                  description: 'Everything nice',
                  // imageUrl: 'https://www.popdaily.com.tw/shaper/u/202304/2a1bc013-2744-4a98-8f07-74885e32a5fd.jpeg',
                  imageUrl: 'assets/images/blossom.jpg',
                  icon: Icons.star,
                ),
                CharacterCard(
                  name: 'Bubbles',
                  color: Colors.blue,
                  description: 'Sugar',
                  // imageUrl: 'https://www.popdaily.com.tw/shaper/u/202304/0f3d18a2-686b-4ed3-9eb5-f8a953ff0b77.jpeg',
                  imageUrl: 'assets/images/bubbles.jpg',
                  icon: Icons.favorite,
                ),
                CharacterCard(
                  name: 'Buttercup',
                  color: Colors.green,
                  description: 'Spice',
                  // imageUrl: 'https://www.popdaily.com.tw/shaper/u/202304/c8ba330e-edf3-4de5-95a5-05286bc5d6b6.jpeg',
                  imageUrl: 'assets/images/buttercup.jpg',
                  icon: Icons.bolt,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final String name;
  final Color color;
  final String description;
  final String imageUrl;
  final IconData icon;

  const CharacterCard({
    super.key,
    required this.name,
    required this.color,
    required this.description,
    required this.imageUrl,
    this.icon = Icons.circle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Increased from 160
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            // child: Image.network(
            child: Image.asset(
              imageUrl,
              height: 200, // Increased from 160
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: color, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Story',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Professor Utonium attempted to create the perfect little girls using sugar, spice, and everything nice. However, he accidentally added Chemical X, creating three superhero sisters: Blossom, Bubbles, and Buttercup.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class GenreSection extends StatelessWidget {
  const GenreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Genre',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              InfoChip(label: 'Action'),
              InfoChip(label: 'Comedy'),
              InfoChip(label: 'Superhero'),
            ],
          ),
          const Divider(height: 32),
          const InfoRow(label: 'Original Release', value: '1998-2005'),
          const InfoRow(label: 'Episodes', value: '78 episodes'),
          const InfoRow(label: 'Network', value: 'Cartoon Network'),
        ],
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final String label;

  const InfoChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EpisodesSection extends StatelessWidget {
  const EpisodesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Episodes',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Colors.pink[50],
              child: const Column(
                children: [
                  SeasonRow(season: '1', episodes: '13', year: '1998-1999'),
                  Divider(height: 1),
                  SeasonRow(season: '2', episodes: '13', year: '1999-2000'),
                  Divider(height: 1),
                  SeasonRow(season: '3', episodes: '12', year: '2000-2001'),
                  Divider(height: 1),
                  SeasonRow(season: '4', episodes: '11', year: '2001-2002'),
                  Divider(height: 1),
                  SeasonRow(season: '5', episodes: '14', year: '2002-2004'),
                  Divider(height: 1),
                  SeasonRow(season: '6', episodes: '15', year: '2004-2005'),
                  Divider(height: 1),
                  SeasonRow(season: 'Specials', episodes: '3', year: '2003-2014'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeasonRow extends StatelessWidget {
  final String season;
  final String episodes;
  final String year;

  const SeasonRow({
    super.key,
    required this.season,
    required this.episodes,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Text(
            season == 'Specials' ? season : 'Season $season',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text('$episodes episodes'),
          ),
          Text(
            year,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CreatorSection extends StatelessWidget {
  const CreatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Created By',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: const NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/0/03/Craig_McCracken_1.jpg',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Craig McCracken',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Animation Director & Creator'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}