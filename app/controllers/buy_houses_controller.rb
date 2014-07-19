class BuyHousesController < ApplicationController
  before_action :set_buy_house, only: [:show, :edit, :update, :destroy]
  
  layout 'general'
  # GET /buy_houses
  # GET /buy_houses.json
  def index
    redirect_to action: :new
    # @buy_houses = BuyHouse.all
  end

  # GET /buy_houses/1
  # GET /buy_houses/1.json
  def show
    # monthly_payment, total_payment = TwLaborIncome.load_payment(buy_house_params["house_price"].to_i,buy_house_params["loan_duration"].to_i)    
    @predicted_income = TwLaborIncome.new.get_prediction(@buy_house)
  end
  # GET /buy_houses/new
  def new
    @buy_house = BuyHouse.new

  end

  # GET /buy_houses/1/edit
  def edit
  end

  # POST /buy_houses
  # POST /buy_houses.json
  def create
    @buy_house = BuyHouse.new(buy_house_params)    
    respond_to do |format|
      if @buy_house.save
        income_param = \
          Hash[buy_house_params.to_hash.map{ |key, value| 
              if value.to_i > 0
                [key, value.to_i]
              else
                [key, value]
              end
          }] 
        format.html { redirect_to @buy_house, notice: 'Buy house was successfully created.' }
        format.json { render :show, status: :created, location: @buy_house }
      else
        format.html { render :new ,error: @buy_house.errors.messages}
        format.json { render json: @buy_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buy_houses/1
  # PATCH/PUT /buy_houses/1.json
  def update
    respond_to do |format|
      if @buy_house.update(buy_house_params)
        format.html { redirect_to @buy_house, notice: 'Buy house was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy_house }
      else
        format.html { render :edit }
        format.json { render json: @buy_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buy_houses/1
  # DELETE /buy_houses/1.json
  def destroy
    @buy_house.destroy
    respond_to do |format|
      format.html { redirect_to buy_houses_url, notice: 'Buy house was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy_house
      @buy_house = BuyHouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_house_params
      params.require(:buy_house).permit(:user_id, :age, :gender,
                                        :monthly_income, :job, :expenditure,
                                        :house_price, :loan_duration)
    end
end
