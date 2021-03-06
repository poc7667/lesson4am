class JosephMemosController < ApplicationController
  before_action :set_joseph_memo, only: [:show, :edit, :update, :destroy]
  layout 'joseph_memo'
  # layout 'welcome'
  include JosephMemosHelper

  # GET /joseph_memos
  # GET /joseph_memos.json
  def index
    @joseph_memos = JosephMemo.all
    @joseph_memo = JosephMemo.new
  end

  def say
    @dest_dir =File.expand_path("joseph_memo/users/#{@joseph_memo.id}_#{@joseph_memo.name}", File.dirname(Rails.root))
    FileUtils.mkdir_p @dest_dir
    unless @joseph_memo.imgs.url.include? "missing.png"
      @imgs_archeive = File.join("#{Rails.root}/public", @joseph_memo.imgs.url).match(/(.*?)(\?.*)/)[1]
      move_imgs_to_dest
      unzip_imgs
    end
    write_info_in_txt
    generate_view
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
        say
        format.html { redirect_to('http://joseph-1986-01-21.info')}
        # format.html { redirect_to @joseph_memo, notice: 'Photo was successfully created.' }
      else
        # format.html { redirect_to new_joseph_memo_path(@joseph_memo :anchor => "error_form")}
        format.html { render :new }
        # format.json { render json: @joseph_memo.errors, status: :unprocessable_entity }
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
      params.require(:joseph_memo).permit(:name, :title, :words, :videos, :imgs)
    end
end
