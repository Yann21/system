#!/bin/bash

SRC_DIR="/jellyfin/Youtube"
DEST_DIR="/home/yann/Documents/Media/Podcasts"

mkdir -p "$DEST_DIR"

# Loop over both .mp4 and .webm
find "$SRC_DIR" -type f \( -iname '*.mp4' -o -iname '*.webm' \) | while IFS= read -r video_path; do
  filename="$(basename "$video_path")"
  base="${filename%.*}"
  audio_file="$DEST_DIR/$base.mp3"

  # Skip if already exists
  if [ -f "$audio_file" ]; then
    echo "[✓] Skipping existing: $filename"
    continue
  fi

  echo "[→] Converting: $filename"
  ffmpeg -hide_banner -loglevel error -nostdin -i "$video_path" -vn -acodec libmp3lame -ab 192k "$audio_file" \
    && echo "[✔] Done: $filename" \
    || echo "[✗] Failed: $filename"

done

