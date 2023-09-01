Rails.application.routes.draw do
  get 'furikomi/select_bank'
  get 'furikomi/set_bank'
  get 'furikomi/select_shiten'
  get 'furikomi/set_shiten'
  get 'furikomi/select_saki_kouza'
  get 'furikomi/set_saki_kouza'
  get 'furikomi/select_moto_kouza'
  get 'furikomi/set_moto_kouza'
  get 'furikomi/input_kingaku'
  get 'furikomi/set_kingaku'
  get 'furikomi/kakunin'
  get 'furikomi/jikkou'
  get 'furikomi/kekka'
  get 'futsu_yokin/new'
  get 'futsu_yokin/create'
  get 'futsu_yokin/kekka'
  get 'error/show'
  get 'meisai/index'
  get 'user/top'
  get 'user/login'
  get 'user/logodd'
  get 'user/new'
  get 'user/create'
  get 'user/kekka'
  get 'user/mypage'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
