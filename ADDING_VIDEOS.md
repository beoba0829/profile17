# Adding Videos for Models

Each model now has their own set of videos stored in the database. When you visit a model's profile page, they will only see videos that belong to them.

## How to Add Videos for a Model

You can add videos for any model using SQL queries in your Supabase dashboard or through the API.

### Using SQL (Supabase Dashboard)

Go to your Supabase SQL Editor and run:

```sql
INSERT INTO model_videos (model_name, city, video_url, video_order, title, duration)
VALUES
  ('Thùy Tiên', 'sg', 'https://your-video-url.mp4', 1, 'Video chính', '2:34'),
  ('Thùy Tiên', 'sg', 'https://your-video-url-2.mp4', 2, 'Cuộc sống hàng ngày', '1:45');
```

### Field Descriptions

- **model_name**: The model's full name (e.g., 'Mai Linh', 'Thùy Tiên', 'Hồng Thắm')
- **city**: City code - 'sg' (Sài Gòn), 'hn' (Hà Nội), 'dn' (Đà Nẵng), 'nt' (Nha Trang)
- **video_url**: Full URL to the video file (must be publicly accessible)
- **video_order**: Display order (1, 2, 3, 4, etc.) - videos are shown in ascending order
- **title**: Optional - Video title/description
- **duration**: Optional - Video duration like "2:34"

## City Codes Reference

- `sg` - Sài Gòn (Hồ Chí Minh)
- `hn` - Hà Nội
- `dn` - Đà Nẵng
- `nt` - Nha Trang

## Example: Adding Videos for Multiple Models

```sql
-- Add videos for Thùy Tiên (Sài Gòn)
INSERT INTO model_videos (model_name, city, video_url, video_order, title)
VALUES
  ('Thùy Tiên', 'sg', 'https://example.com/video1.mp4', 1, 'Giới thiệu'),
  ('Thùy Tiên', 'sg', 'https://example.com/video2.mp4', 2, 'Hoạt động hàng ngày'),
  ('Thùy Tiên', 'sg', 'https://example.com/video3.mp4', 3, 'Du lịch');

-- Add videos for Hồng Thắm (Hà Nội)
INSERT INTO model_videos (model_name, city, video_url, video_order, title)
VALUES
  ('Hồng Thắm', 'hn', 'https://example.com/hong-tham-1.mp4', 1, 'Video chính'),
  ('Hồng Thắm', 'hn', 'https://example.com/hong-tham-2.mp4', 2, 'Phong cách'),
  ('Hồng Thắm', 'hn', 'https://example.com/hong-tham-3.mp4', 3, 'Sự kiện');
```

## Current Videos

Currently, only **Mai Linh** (Sài Gòn) has videos configured:
- 4 videos from Cloudinary

All other models (47 models) will show "Chưa có video" until you add their videos.

## What Happens if No Videos?

If a model has no videos in the database:
- The video section will show a placeholder with "Chưa có video"
- The video navigation dots won't appear
- The page still works perfectly - it just shows no videos

## Testing

After adding videos, visit the model's profile page:
- URL format: `/profile?city=sg&name=Mai%20Linh`
- Replace `sg` with the city code
- Replace `Mai%20Linh` with the URL-encoded model name

Example URLs:
- Mai Linh: `/profile?city=sg&name=Mai%20Linh`
- Thùy Tiên: `/profile?city=sg&name=Th%C3%B9y%20Ti%C3%AAn`
- Hồng Thắm: `/profile?city=hn&name=H%E1%BB%93ng%20Th%E1%BA%AFm`
