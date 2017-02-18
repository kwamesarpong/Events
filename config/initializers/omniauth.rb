Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "5zURke7AmnWWKbiYLyEivDeg0", "DCDTGwIhXEx9chbUkFSv7G8J3ytcv3h60yMX6tPB0e6pZZ0coC",
   {
      :secure_image_url => 'true',
      :image_size => 'original',
  }



  provider :facebook, "1759008331021490", "e512d4fd7034b881f730c41d6863c344"
  
end