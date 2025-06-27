import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MoodOption {
  final String emoji;
  final String label;
  final Color color;

<<<<<<< HEAD
  const MoodOption({
    required this.emoji,
    required this.label,
    required this.color,
  });
=======
  MoodOption({required this.emoji, required this.label, required this.color});
>>>>>>> 3810d7744425610881516fe56233fb8b3c9d340a
}

class AddMoodScreen extends StatefulWidget {
  const AddMoodScreen({super.key});

  @override
  State<AddMoodScreen> createState() => _AddMoodScreenState();
}

class _AddMoodScreenState extends State<AddMoodScreen> {
<<<<<<< HEAD
  final _noteController = TextEditingController();
  MoodOption? _selectedMood;
  bool _isLoading = false;

  static const List<MoodOption> _moodOptions = [
=======
  final List<MoodOption> _moodOptions = [
>>>>>>> 3810d7744425610881516fe56233fb8b3c9d340a
    MoodOption(emoji: '😊', label: 'Happy', color: Colors.yellow),
    MoodOption(emoji: '😔', label: 'Sad', color: Colors.blue),
    MoodOption(emoji: '😡', label: 'Angry', color: Colors.red),
    MoodOption(emoji: '😰', label: 'Anxious', color: Colors.orange),
    MoodOption(emoji: '😴', label: 'Tired', color: Colors.purple),
<<<<<<< HEAD
    MoodOption(emoji: '🤔', label: 'Confused', color: Colors.brown),
    MoodOption(emoji: '😍', label: 'Loved', color: Colors.pink),
    MoodOption(emoji: '😎', label: 'Cool', color: Colors.teal),
    MoodOption(emoji: '🤗', label: 'Grateful', color: Colors.green),
  ];

=======
    MoodOption(emoji: '🤔', label: 'Thoughtful', color: Colors.teal),
    MoodOption(emoji: '😌', label: 'Calm', color: Colors.green),
    MoodOption(emoji: '😍', label: 'Excited', color: Colors.pink),
    MoodOption(emoji: '😐', label: 'Neutral', color: Colors.grey),
  ];

  MoodOption? _selectedMood;
  final _noteController = TextEditingController();
  bool _isLoading = false;

>>>>>>> 3810d7744425610881516fe56233fb8b3c9d340a
  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _saveMoodEntry() async {
    if (_selectedMood == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a mood')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = Supabase.instance.client.auth.currentUser;
<<<<<<< HEAD
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await Supabase.instance.client.from('mood_entries').insert({
        'user_id': user.id,
        'mood_emoji': _selectedMood!.emoji,
        'mood_label': _selectedMood!.label,
        'note': _noteController.text.trim().isEmpty ? null : _noteController.text.trim(),
        'created_at': DateTime.now().toIso8601String(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mood saved successfully!')),
        );
        Navigator.of(context).pop(true); // Return true to indicate success
      }
    } catch (error) {
=======
      
      await Supabase.instance.client.from('mood_entries').insert({
        'user_id': user!.id,
        'mood_emoji': _selectedMood!.emoji,
        'mood_label': _selectedMood!.label,
        'note': _noteController.text.trim().isEmpty ? null : _noteController.text.trim(),
      });

      if (mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mood saved successfully!')),
        );
      }
    } catch (error) {
      setState(() => _isLoading = false);
>>>>>>> 3810d7744425610881516fe56233fb8b3c9d340a
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving mood: $error')),
        );
      }
<<<<<<< HEAD
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
=======
>>>>>>> 3810d7744425610881516fe56233fb8b3c9d340a
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mood'),
<<<<<<< HEAD
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How are you feeling?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _moodOptions.length,
                itemBuilder: (context, index) {
                  final mood = _moodOptions[index];
                  final isSelected = _selectedMood == mood;
                  
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedMood = mood;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? mood.color.withOpacity(0.2) : Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? mood.color : Colors.grey[300]!,
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mood.emoji,
                            style: const TextStyle(fontSize: 32),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            mood.label,
                            style: TextStyle(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? mood.color : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Add a note (optional)',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                hintText: 'What made you feel this way?',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16),
              ),
              maxLines: 3,
              maxLength: 200,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveMoodEntry,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Save Mood',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
=======
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _saveMoodEntry,
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
>>>>>>> 3810d7744425610881516fe56233fb8b3c9d340a
