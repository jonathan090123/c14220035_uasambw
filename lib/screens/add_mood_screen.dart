import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MoodOption {
  final String emoji;
  final String label;
  final Color color;

  MoodOption({required this.emoji, required this.label, required this.color});
}

class AddMoodScreen extends StatefulWidget {
  const AddMoodScreen({super.key});

  @override
  State<AddMoodScreen> createState() => _AddMoodScreenState();
}

class _AddMoodScreenState extends State<AddMoodScreen> {
  final List<MoodOption> _moodOptions = [
    MoodOption(emoji: '😊', label: 'Happy', color: Colors.yellow),
    MoodOption(emoji: '😔', label: 'Sad', color: Colors.blue),
    MoodOption(emoji: '😡', label: 'Angry', color: Colors.red),
    MoodOption(emoji: '😰', label: 'Anxious', color: Colors.orange),
    MoodOption(emoji: '😴', label: 'Tired', color: Colors.purple),
    MoodOption(emoji: '🤔', label: 'Thoughtful', color: Colors.teal),
    MoodOption(emoji: '😌', label: 'Calm', color: Colors.green),
    MoodOption(emoji: '😍', label: 'Excited', color: Colors.pink),
    MoodOption(emoji: '😐', label: 'Neutral', color: Colors.grey),
  ];

  MoodOption? _selectedMood;
  final _noteController = TextEditingController();
  bool _isLoading = false;

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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving mood: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mood'),
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