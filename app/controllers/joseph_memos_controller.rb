class JosephMemosController < ApplicationController
  before_action :set_joseph_memo, only: [:show, :edit, :update, :destroy]
  layout 'welcome'

  # GET /joseph_memos
  # GET /joseph_memos.json
  def index
    @joseph_memos = JosephMemo.all
  end

  # GET /joseph_memos/1
  # GET /joseph_memos/1.json
  def show
  end

  # GET /joseph_memos/new
  def new
    @joseph_memo = JosephMemo.new
  end

  # GET /joseph_memos/1/edit
  def edit
  end

  # POST /joseph_memos
  # POST /joseph_memos.json
  def create
    @joseph_memo = JosephMemo.new(joseph_memo_params)

    respond_to do |format|
      if @joseph_memo.save
        format.html { redirect_to @joseph_memo, notice: 'Joseph memo was successfully created.' }
        format.json { render :show, status: :created, location: @joseph_memo }
      else
        format.html { render :new }
        format.json { render json: @joseph_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joseph_memos/1
  # PATCH/PUT /joseph_memos/1.json
  def update
    respond_to do |format|
      if @joseph_memo.update(joseph_memo_params)
        format.html { redirect_to @joseph_memo, notice: 'Joseph memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @joseph_memo }
      else
        format.html { render :edit }
        format.json { render json: @joseph_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joseph_memos/1
  # DELETE /joseph_memos/1.json
  def destroy
    @joseph_memo.destroy
    respond_to do |format|
      format.html { redirect_to joseph_memos_url, notice: 'Joseph memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joseph_memo
      @joseph_memo = JosephMemo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joseph_memo_params
      params.require(:joseph_memo).permit(:name, :title, :words, :videos)
    end
end
