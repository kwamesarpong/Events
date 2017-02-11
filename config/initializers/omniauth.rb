Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "5zURke7AmnWWKbiYLyEivDeg0", "DCDTGwIhXEx9chbUkFSv7G8J3ytcv3h60yMX6tPB0e6pZZ0coC",
   {
      :secure_image_url => 'true',
      :image_size => 'original',
  }



  provider :facebook, "1759008331021490", "6cffd0ebe4234e19debbf4f68ba34b58",
    scope: 'email,user_birthday', display: 'popup'
  
end