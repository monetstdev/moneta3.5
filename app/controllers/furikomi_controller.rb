class FurikomiController < ApplicationController
  # GET /furikomi/select_moto_kouza
  def select_moto_kouza
    @user = User.find(session[:user_id])
    @kouza = Kouza.where(user_id: @user.id)
    render :select_moto_kouza
  end

  # POST /furikomi/set_moto_kouza
  def set_moto_kouza
    session[:moto_kouza_id] = params[:moto_kouza_id]
    redirect_to "/furikomi/select_bank"
  end

  # GET /furikomi/select_bank
  def select_bank
    render :select_bank
  end

  # POST /furikomi/set_bank
  def set_bank
    session[:bank_bangou] = params[:bank_bangou]
    redirect_to "/furikomi/select_shiten"
  end

  # GET /furikomi/select_shiten
  def select_shiten
    @shitens = Shiten.select do |shiten_bango, shiten|
      shiten["bank_bangou"] == session[:bank_bangou]
    end
  end

  # POST /furikomi/set_shiten
  def set_shiten
    session[:shiten_bangou] = params[:shiten_bangou]
    redirect_to "/furikomi/select_saki_kouza"
  end

  # GET /furikomi/select_saki_kouza
  def select_saki_kouza
    @kouzas = Kouza.where(shiten_bangou: session[:shiten_bangou])
    render :select_saki_kouza
  end

  # POST /furikomi/set_saki_kouza
  def set_saki_kouza
    session[:saki_kouza_id] = params[:saki_kouza_id]
    redirect_to "/furikomi/input_kingaku"
  end

  # GET /furikomi/input_kingaku
  def input_kingaku
    render :input_kingaku
  end

  # POST /furikomi/set_kingaku
  def set_kingaku
    session[:kingaku] = params[:kingaku]
    redirect_to "/furikomi/kakunin"
  end

  # GET /furikomi/kakunin
  def kakunin
    @moto_kouza = Kouza.find(session[:moto_kouza_id])
    @saki_kouza = Kouza.find(session[:saki_kouza_id])
    @kingaku = session[:kingaku]
    render :kakunin
  end

  # POST /furikomi/jikkou
  def jikkou
    @moto_kouza = Kouza.find(session[:moto_kouza_id])
    @saki_kouza = Kouza.find(session[:saki_kouza_id])
    @kingaku = session[:kingaku].to_i

    # 残高不足
    zandaka = @moto_kouza.zandaka
    if zandaka + 1000000 < @kingaku
      flash[:alert] = "残高が足りません"
      redirect_to "/furikomi/input_kingaku"
    else
      # 振込元口座から引き落とし
      @moto_kouza.update(zandaka: zandaka - @kingaku)
      @moto_kouza.meisai.create(
        kubun: :syukkin,
        kingaku: @kingaku,
        zandaka: zandaka - @kingaku,
        tekiyou: "#{@saki_kouza.user.kanji_name}への振込",
      )

      # 貸越処理
      if @moto_kouza.zandaka < 0
        @moto_kouza.meisai.create(
          kubun: :syukkin,
          kingaku: -@moto_kouza.zandaka / 20,
          zandaka: @moto_kouza.zandaka * 19 / 20,
          tekiyou: "貸越利息",
        )
        @moto_kouza.update(zandaka: @moto_kouza.zandaka * 19 / 20)
      end

      # 振込先口座に入金
      @saki_kouza.update(zandaka: @saki_kouza.zandaka + @kingaku)
      @saki_kouza.meisai.create(
        kubun: :nyuukin,
        kingaku: @kingaku,
        zandaka: @saki_kouza.zandaka,
        tekiyou: "#{@moto_kouza.user.kanji_name}からの振込",
      )

      redirect_to "/furikomi/kekka"
    end
  end

  # GET /furikomi/kekka
  def kekka
  end
end
