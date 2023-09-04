require "digest"

class UsersController < ApplicationController
  # GET /top
  def top
    @login_id = session[:login_id]
    @password = session[:password]

    # /app/views/users/top.html.erb
    render :top
  end

  # POST /login
  def login
    login_id = params[:login_id]
    password = params[:password]
    user = User.find_by(login_id: login_id)

    if user != nil && user.hashed_password == Digest::MD5.hexdigest(password)
      session[:login_id] = nil
      session[:password] = nil
      session[:user_id] = user.id
      redirect_to :mypage
    else
      flash[:alert] = "ユーザーIDまたはパスワードが違います"
      session[:login_id] = login_id
      session[:password] = password
      redirect_to :top
    end
  end

  # GET /logoff
  def logoff
    session[:user_id] = nil
    flash.now[:notice] = "ご利用ありがとうございました"
    # app/views/users/logoff.html.erb
    render :logoff
  end

  # GET /users/new
  def new
    @login_id = session[:login_id]
    @password = session[:password]
    @kanji_name = session[:kanji_name]
    @kana_name = session[:kana_name]
    @email = session[:email]
    @yubin = session[:yubin]
    @jusho = session[:jusho]

    # /app/views/users/new.html.erb
    render :new
  end

  # POST /users
  def create
    login_id = params[:login_id]
    password = params[:password]
    kanji_name = params[:kanji_name]
    kana_name = params[:kana_name]
    email = params[:email]
    yubin = params[:yubin]
    jusho = params[:jusho]

    error_msg = is_user_valid?(
      login_id,
      password,
      kanji_name,
      kana_name,
      email,
      yubin,
      jusho
    )

    if error_msg.empty?
      user = User.create!(
        bank_bangou: "1000",
        login_id: login_id,
        hashed_password: Digest::MD5.hexdigest(password),
        kanji_name: kanji_name,
        kana_name: kana_name,
        email: email,
        yubin: yubin,
        jusho: jusho,
      )
      redirect_to "/users/kekka/#{user.id}"
    else
      session[:login_id] = login_id
      session[:password] = password
      session[:kanji_name] = kanji_name
      session[:kana_name] = kana_name
      session[:email] = email
      session[:yubin] = yubin
      session[:jusho] = jusho

      redirect_to :users_new, alert: error_msg.join(" ")
    end
  end

  def is_user_valid?(
    login_id,
    password,
    kanji_name,
    kana_name,
    email,
    yubin,
    jusho
  )
    error_msg = []

    if login_id.nil? || login_id.size < 3
      error_msg << "ログインIDは３文字以上必要です"
    end

    if password.nil? || password.size < 4
      error_msg << "パスワードは４文字以上必要です"
    end

    if kanji_name.nil? || kanji_name == ""
      error_msg << "漢字氏名は必須入力です"
    end

    if kana_name.nil? || kana_name == ""
      error_msg << "かな氏名は必須入力です"
    end

    return error_msg
  end

  # GET /users/kekka/:user_id
  def kekka
    @user = User.find(params[:user_id])
    # /app/views/users/kekka.html.erb
    render :kekka
  end

  # GET /mypage
  def mypage
    @user_id = session[:user_id]
    @user = User.find(@user_id)

    if @user != nil
      # /app/views/users/mypage.html.erb
      render :mypage
    else
      redirect_to :logoff
    end
  end

  # GET /kouza
  def kouza
    @user_id = session[:user_id]
    @user = User.find(@user_id)

    @kouza = Kouza.where(user_id: @user_id)
    render :kouza
  end
end
