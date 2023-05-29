class SystemCheck {

  static bool musiccheck = true;
  static bool sfxcheck = true;

  static void setmusic (bool val)
  {
    musiccheck=val;
  }
  static void setsfx (bool val)
  {
    sfxcheck=val;
  }
  static bool getmusic ()
  {
    return musiccheck;
  }
  static bool getsfx ()
  {
    return sfxcheck;
  }

}