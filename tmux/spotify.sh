#!/usr/bin/env osascript
# Returns the current playing song in Spotify for OSX

tell application "System Events"
    set ProcessList to name of every process
    if "Spotify" is in ProcessList then
        tell application "Spotify"
            if it is running then
                if player state is playing then
                    set track_name to name of current track
                        set artist_name to artist of current track

                        "♫ " & track_name
                end if
            end if
        end tell
    end if
end tell
