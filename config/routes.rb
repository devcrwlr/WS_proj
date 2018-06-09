Rails.application.routes.draw do
  resources :tracks
  resources :images
  resources :albums
  resources :karaokes
  resources :lyrics do
  	collection { post :songurl }
  end
  resources :mp3s do
    collection { post :validatemp3  }
  end
  resources :mp4s
  resources :songs do
  	collection { post :import  }
  end
  resources :homes

  root 'songs#index'

  get 'lyrics/get_lyrics'

  get 'songs/clear'

  post 'mp4s/mp4_content'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
