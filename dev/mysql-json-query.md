### query first element from json_array
```sql
SELECT preview_photo_url->"$[0].url" as previewPhotoUrl1, preview_photo_url->"$[1].url" as previewPhotoUrl2 FROM (SELECT "[{\"url\":\"images//0d2ef8e9-afb7-49de-b0f5-5d769afb2853.jpg\"}]" AS urls) t
```
