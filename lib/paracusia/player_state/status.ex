defmodule Paracusia.PlayerState.Status do
  defstruct volume: nil,           # 0-100 during play/pause, -1 if playback is stopped
            repeat: nil,           # true or false
            random: nil,           # true or false
            single: nil,           # true or false
            consume: nil,          # true or false
            playlist: nil,         # the playlist version number
            playlist_length: nil,  # integer, the length of the playlist
            state: nil,            # :play, :stop, or :pause
            song_pos: nil,         # playlist song number of the current song stopped on or playing
            song_id: nil,          # playlist songid of the current song stopped on or playing
            next_song_pos: nil,    # playlist song number of the next song to be played
            next_song_id: nil,     # playlist songid of the next song to be played
            time: nil,             # total time elapsed (of current playing/paused song)
            elapsed: nil,          # like time, but with higher resolution.
            duration: nil,         # Duration of the current song in seconds
            bitrate: nil,          # instantaneous bitrate in kbps
            xfade: nil,            # crossfade in seconds
            mixrampdb: nil,        # mixramp threshold in dB
            mixrampdelay: nil,     # mixrampdelay in seconds
            audio: nil,            # sampleRate:bits:channels
            updating_db: nil,      # job id
            error: nil,            # error message, if there is an error
            timestamp: nil         # indicates when the information was retrieved (not part
                                   #   of the MPD protocol)
end
