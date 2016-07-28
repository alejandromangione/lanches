class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :filter_date, only: [:index]


  def index

    if session[:filter_date].present?
      @orders = Order.all.by_date(session[:filter_date])
    else
      @orders = Order.all
    end

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @items = Item.all
    @users = User.all
    @labels = Label.all
  end

  # GET /orders/1/edit
  def edit
    @items = Item.all
    @users = User.all
    @labels = Label.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_user_params)

    respond_to do |format|
      if @order.save && order_update_items && order_update_labels
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_user_params) && order_update_items && order_update_labels
        format.html { redirect_to orders_url, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def order_user_params
      params.require(:order).permit(:user_id)
    end

    def order_update_items
      @order.items = []
      params.require(:order).require(:item_ids).each do |i|
        @order.items.push(Item.find_by(id: i))
      end
    end

    def order_update_labels
      @order.labels = []
      params.require(:order).require(:label_ids).each do |i|
        @order.labels.push(Label.find_by(id: i))
      end
    end

    def filter_date
      session[:filter_date] = params.try(:[], :date)
    end
end
