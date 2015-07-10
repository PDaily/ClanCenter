class SiteNewsController < ApplicationController
  before_action :set_site_news, only: [:show, :edit, :update, :destroy]

  # GET /site_news
  # GET /site_news.json
  def index
    @site_news = SiteNews.all
  end

  # GET /site_news/1
  # GET /site_news/1.json
  def show
  end

  # GET /site_news/new
  def new
    @site_news = SiteNews.new
  end

  # GET /site_news/1/edit
  def edit
  end

  # POST /site_news
  # POST /site_news.json
  def create
    @site_news = SiteNews.new(site_news_params)
    @site_news.user = current_user
    
    respond_to do |format|
      if @site_news.save
        format.html { redirect_to @site_news, notice: 'Site news was successfully created.' }
        format.json { render :show, status: :created, location: @site_news }
      else
        format.html { render :new }
        format.json { render json: @site_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_news/1
  # PATCH/PUT /site_news/1.json
  def update
    respond_to do |format|
      if @site_news.update(site_news_params)
        format.html { redirect_to @site_news, notice: 'Site news was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_news }
      else
        format.html { render :edit }
        format.json { render json: @site_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_news/1
  # DELETE /site_news/1.json
  def destroy
    @site_news.destroy
    respond_to do |format|
      format.html { redirect_to site_news_index_url, notice: 'Site news was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_news
      @site_news = SiteNews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_news_params
      params.require(:site_news).permit(:title, :body, :user)
    end
end
