class UsersController < ApplicationController
  # GET /users/top
  def top
    # /app/views/users/top.html.erb
    render :top 
  end

  # POST /login
  def login
    redirect_to :mypage
  end

  # POST /logoff
  def logoff
    redirect_to :users_top
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
    # /app/views/users/mypage.html.erb
    render :mypage
  end
end
