require "digest"

class UsersController < ApplicationController
  # GET /top
  def top
    # /app/views/users/top.html.erb
    render :top
  end

  # POST /login
  def login
    login_id = params[:login_id]
    password = params[:password]

    user = User.find_by(login_id: login_id)
    if user.nil?
      @error = [
        "ユーザーIDが違います"
      ]
      render :top
      return
    end

    if user.hashed_password != Digest::MD5.hexdigest(password)
      @error = [
        "パスワードが違います"
      ]
      render :top
      return
    end

    cookies[:user_id] = user.id
    redirect_to :mypage
  end

  # POST /logoff
  def logoff
    cookies[:user_id] = nil
    @message = [
      "ご利用ありがとうございました"
    ]
    redirect_to :top
  end

  # GET /users/new
  def new
    # /app/views/users/new.html.erb
    render :new
  end

  # POST /users
  def create
    redirect_to :users_kekka
  end

  # GET /users/kekka
  def kekka
    # /app/views/users/kekka.html.erb
    render :kekka
  end

  # GET /users/mypage
  def mypage
    user_id = cookies[:user_id]
    if user_id.nil?
      @error = [
        "不正なリクエストです"
      ]
      render :top
      return
    end

    @user = User.find(user_id)
    if @user.nil?
      @error = [
        "不正なリクエストです"
      ]
      cookies[:user_id] = nil
      render :top
      return
    end

    # /app/views/users/mypage.html.erb
    render :mypage
  end
end
