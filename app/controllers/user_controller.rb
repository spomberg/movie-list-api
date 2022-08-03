class UserController < ApplicationController
  include ListHelper

  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :destroy]

  # GET /users
  def index
    @users = user.all
    render json: @users, status: ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessed_entity
    end
  end

  private
  def user_params
    params.permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

# def show
#   lists = List.where(:user_id => "0").order_by([:created_on, :desc])

#   output = []
  
#   lists.each do |list|
#     output.push({
#       id: list["_id"],
#       title: list["title"],
#       created_on: list["created_on"]
#     })
#   end
  
#   output

#   render json: output.to_json
# end