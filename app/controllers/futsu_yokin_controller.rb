class FutsuYokinController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    @bank = Bank.find(@user.bank_id)
    @shitens = @bank.shitens
  end
  
  def create
    @user = User.find(session[:user_id])
    @bank = Bank.find(@user.bank_id)

    shiten_id = params[:shiten_id]
    kouza = Kouza.create!(
      bank_id: @bank.id,
      shiten_id: shiten_id,
      user_id: @user.id,
      kinyu_shohin: :futsu_yokin,
      zandaka: 0,
      bangou: random_kouza_bangou()
    )

    kouza.meisai.create!(
      kubun: :nyuukin,
      kingaku: 0,
      tekiyou: "新規開設"
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
