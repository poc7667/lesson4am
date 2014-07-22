class PairGroupsController < ApplicationController
  before_action :set_pair_group, only: [:show, :edit, :update, :destroy]

  # GET /pair_groups
  # GET /pair_groups.json
  def index
    @pair_groups = PairGroup.all
  end

  # GET /pair_groups/1
  # GET /pair_groups/1.json
  def show
  end

  # GET /pair_groups/new
  def new
    @pair_group = PairGroup.new
  end

  # GET /pair_groups/1/edit
  def edit
  end

  # POST /pair_groups
  # POST /pair_groups.json
  def create
    @pair_group = PairGroup.new(pair_group_params)

    respond_to do |format|
      if @pair_group.save
        format.html { redirect_to @pair_group, notice: 'Pair group was successfully created.' }
        format.json { render :show, status: :created, location: @pair_group }
      else
        format.html { render :new }
        format.json { render json: @pair_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pair_groups/1
  # PATCH/PUT /pair_groups/1.json
  def update
    respond_to do |format|
      if @pair_group.update(pair_group_params)
        format.html { redirect_to @pair_group, notice: 'Pair group was successfully updated.' }
        format.json { render :show, status: :ok, location: @pair_group }
      else
        format.html { render :edit }
        format.json { render json: @pair_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pair_groups/1
  # DELETE /pair_groups/1.json
  def destroy
    @pair_group.destroy
    respond_to do |format|
      format.html { redirect_to pair_groups_url, notice: 'Pair group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pair_group
      @pair_group = PairGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pair_group_params
      params.require(:pair_group).permit(:user_id, :title, :description, :text, :members, :text)
    end
end
