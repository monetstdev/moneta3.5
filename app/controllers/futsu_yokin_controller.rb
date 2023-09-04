class FutsuYokinController < ApplicationController
  def new
    user = User.find(session[:user_id])
    @shitens = Shiten.select do |shiten_ganbou, shiten|
      shiten["bank_bangou"] == user.bank_bangou
    end
  end

  def create
    @user = User.find(session[:user_id])

    shiten_bangou = params[:shiten_bangou]
    kouza = Kouza.create!(
      bank_bangou: "1000",
      shiten_bangou: shiten_bangou,
      user_id: @user.id,
      kinyu_shohin: :futsu_yokin,
      zandaka: 0,
      bangou: random_kouza_bangou(),
    )

    kouza.meisai.create!(
      kubun: :nyuukin,
      kingaku: 0,
      zandaka: 0,
      tekiyou: "新規開設",
    )

    redirect_to "/futsu_yokin/kekka/#{kouza.id}"
  end

  def random_kouza_bangou
    sprintf("%04d", rand(0...10000))
  end

  def kekka
    kouza_id = params[:kouza_id]
    @kouza = Kouza.find(kouza_id)
    render :kekka
  end
end
