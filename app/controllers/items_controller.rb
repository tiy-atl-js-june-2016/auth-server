class ItemsController < ApplicationController
  before_action :authenticate!, except: [:index, :show]
  before_action :set_user_collection!, only: [:index, :show]
  before_action :set_curr_collection!, only: [:create, :update, :destroy]

  def create
    parse_json!
    @item = @collection.items.new(data: @data)
    if @item.save
      render "create.json.jbuilder", status: :created
    else
      render "errors.json.jbuilder", status: :unprocessable_entity
    end
  end

  def index
    @items = @collection.items.page(params[:page]).per(params[:per_page])
    render "index.json.jbuilder", status: :ok
  end

  def show
    @item = @collection.items.find(params[:id])
    render "show.json.jbuilder", status: :ok
  end

  def update
    parse_json!
    @item = @collection.items.find(params[:id])
    if @item.update(@data)
      render "show.json.jbuilder", status: :accepted
    else
      render "errors.json.jbuilder", status: :unprocessable_entity
    end
  end

  def destroy
    @item = @collection.items.find(params[:id])
    render json: {}, status: :no_content
  end

  private
  def set_user_collection!
    @user = User.find_by!(username: params[:username])
    @collection = @user.collections.find_or_create_by(title: params[:collection])
  end

  def set_curr_collection!
    @collection = current_user.collections.find_or_create_by(title: params[:collection])
  end

  # This is so damn purple.
  def parse_json!
    @data = JSON.parse(request.body.read)
    request.body.rewind
  end
end
