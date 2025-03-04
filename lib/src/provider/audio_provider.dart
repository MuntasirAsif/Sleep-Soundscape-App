import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:soundscape/core/constant/text.dart';
import 'package:soundscape/core/utils/utils.dart';
import '../features/model/sound_model.dart';

class AudioProvider extends ChangeNotifier {
  final List<SoundModel> _sounds = [];
  final Map<String, AudioPlayer> _players = {};
  final Map<String, double> _volumeLevels = {};
  bool _isPlayingAll = false;
  String _mixNameText = AppTexts.your;

  List<SoundModel> get sounds => List.unmodifiable(_sounds);
  bool get isPlayingAll => _isPlayingAll;
  String get mixNameText => _mixNameText;
  List<SoundModel> get soundList => _sounds;

  bool isAddedToMix(SoundModel sound) => _sounds.contains(sound);

  void addSound(BuildContext context, SoundModel sound) {
    if (_sounds.contains(sound)) {
      Utils().toastMessage(context, AppTexts.alreadyAddedSound);
      return;
    }
    _sounds.add(sound);
    _players[sound.id] = AudioPlayer();
    _volumeLevels[sound.id] = 0.5;
    notifyListeners();
  }

  void removeAllSound() {
    for (var player in _players.values) {
      player.stop();
      player.dispose();
    }
    _players.clear();
    soundList.clear();
    notifyListeners();
  }

  void removeSound(String soundId) {
    _players[soundId]?.dispose();
    _players.remove(soundId);
    _sounds.removeWhere((sound) => sound.id == soundId);
    _volumeLevels.remove(soundId);
    notifyListeners();
  }

  Future<void> play(SoundModel sound) async {
    final player = _players[sound.id];
    if (player != null) {
      if (player.processingState == ProcessingState.completed || player.position == Duration.zero) {
        await player.setUrl(sound.audioUrl);
      }
      player.setVolume(getVolume(sound));
      player.play();
      notifyListeners();
    }
  }

  void pause(SoundModel sound) {
    _players[sound.id]?.pause();
    notifyListeners();
  }

  void togglePlayPause(SoundModel sound) {
    final player = _players[sound.id];
    if (player != null) {
      if (player.playing) {
        pause(sound);
      } else {
        play(sound);
      }
    }
  }

  Future<void> playAll() async {
    for (var sound in _sounds) {
      await play(sound);
    }
    _isPlayingAll = true;
    notifyListeners();
  }

  void pauseAll() {
    for (var player in _players.values) {
      player.pause();
    }
    _isPlayingAll = false;
    notifyListeners();
  }

  void stopAll() {
    for (var player in _players.values) {
      player.stop();
    }
    _isPlayingAll = false;
    notifyListeners();
  }

  void setVolume(SoundModel sound, double volume) {
    _volumeLevels[sound.id] = volume;
    _players[sound.id]?.setVolume(volume);
    notifyListeners();
  }

  double getVolume(SoundModel sound) => _volumeLevels[sound.id] ?? 1.0;

  /// Save Mix
  Future<void> saveMix(String mixName) async {
    final prefs = await SharedPreferences.getInstance();
    final mixData = jsonEncode(_sounds.map((sound) => sound.toJson()).toList());
    await prefs.setString(mixName, mixData);
  }

  /// Load Mix
  Future<void> loadMix(String mixName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final mixData = prefs.getString(mixName);

      pauseAll();
      if (mixData != null) {
        List<dynamic> jsonList = jsonDecode(mixData);

        _sounds.clear();
        _players.clear();
        _volumeLevels.clear();

        for (var json in jsonList) {
          SoundModel sound = SoundModel.fromJson(json);
          _sounds.add(sound);

          // Initialize AudioPlayer
          AudioPlayer player = AudioPlayer();
          _players[sound.id] = player;

          // Set volume
          _volumeLevels[sound.id] = 0.5;

          // Play the sound
          _isPlayingAll = true;
          notifyListeners();
        }

        notifyListeners();
      }else{
      }
    } catch (e) {
      debugPrint("Error loading mix: $e");
    }
  }



  Future<void> renameMix(String oldName, String newName) async {
    final prefs = await SharedPreferences.getInstance();
    final mixData = prefs.getString(oldName);
    if (mixData != null) {
      await prefs.setString(newName, mixData); // Save mix with new name
      await prefs.remove(oldName); // Remove old mix name
    }
  }


  /// Get Saved Mixes List
  Future<List<String>> getSavedMixes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys().toList();
  }

  Future<List<String>> getMixSoundImages(String mixName) async {
    final prefs = await SharedPreferences.getInstance();
    final mixData = prefs.getString(mixName);

    if (mixData == null) return []; // Return empty list if mix not found

    List<dynamic> decodedData = jsonDecode(mixData);

    // Convert to List of SoundModel and extract names
    return decodedData.map<String>((json) => SoundModel.fromJson(json).imageUrl).toList();
  }
  Future<List<String>> getMixSoundName(String mixName) async {
    final prefs = await SharedPreferences.getInstance();
    final mixData = prefs.getString(mixName);

    if (mixData == null) return []; // Return empty list if mix not found

    List<dynamic> decodedData = jsonDecode(mixData);

    // Convert to List of SoundModel and extract names
    return decodedData.map<String>((json) => SoundModel.fromJson(json).name).toList();
  }


  @override
  void dispose() {
    for (var player in _players.values) {
      player.dispose();
    }
    super.dispose();
  }
}
