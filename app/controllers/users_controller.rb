# require 'twilio-ruby'

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :client, only: [:call, :text]

  def index
    # @users = User.all
    # User.import force: true
    # @users = User.search(query: { match: { skill_name: params[:search], latitude: params[:lat], longitude: params[:lng] }}).results
    @users = User.search(params[:search]).results

    respond_to do |format|
      format.json{render :json => @users}
    end
  end

  def show
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
    # render json: @hash
  end

  def new
    @user = User.new
  end

  def create

   @user = User.new(user_params)
   # byebug
   @user.skills << Skill.find(params[:user][:skill_id].to_i)
   
   if @user.save
      session[:user_id] = @user.id
      respond_to do |format|
        format.json{render :json => @user}
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destory
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address)
  end

  #  # set up a client to talk to the Twilio REST API
  # def client
  #   # put your own credentials here
  #   account_sid = ENV['ACCOUNT_SID']
  #   auth_token = ENV['AUTH_TOKEN']
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  # end

  # def call
  #   @client.account.calls.create({ 
  #     :from => '+16042276756',   
  #     :method => 'GET',  
  #     :fallback_method => 'GET',  
  #     :status_callback_method => 'GET',    
  #     :record => 'false'
  #   })
  # end

  # def text
  #   # msg = params[:message]
  #   #to_user_id = params[:to_user_id]
  #   # to_user_tel_num = User.find(to_user_id).number
  #   @client.messages.create(
  #       :body => "Hello, how are you doing?",
  #       :to => "+17789900113",
  #       :from => '+16042276756')
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  # end

end
  

