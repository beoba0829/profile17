/*
  # Create Model Videos Table

  1. New Tables
    - `model_videos`
      - `id` (uuid, primary key)
      - `model_name` (text) - The model's full name
      - `city` (text) - City code: sg, hn, dn, nt
      - `video_url` (text) - Full URL to the video
      - `video_order` (integer) - Display order of videos
      - `title` (text, optional) - Video title/description
      - `duration` (text, optional) - Video duration like "2:34"
      - `created_at` (timestamptz) - Timestamp

  2. Security
    - Enable RLS on `model_videos` table
    - Add policy for public read access (videos are public content)
*/

CREATE TABLE IF NOT EXISTS model_videos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  model_name text NOT NULL,
  city text NOT NULL,
  video_url text NOT NULL,
  video_order integer NOT NULL DEFAULT 0,
  title text,
  duration text,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE model_videos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view model videos"
  ON model_videos
  FOR SELECT
  TO public
  USING (true);

CREATE INDEX IF NOT EXISTS idx_model_videos_lookup 
  ON model_videos(city, model_name, video_order);
