class NewsController < ApplicationController
  before_action :set_news, only: %i[ show edit update destroy ]

  # GET /news or /news.json
  def index
    @news = News.all
  end

  # GET /news/1 or /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news or /news.json
  def create
    @news = News.new(news_params)
      if @news.save
        redirect_to news_index_path
      else
        render :new
      end
  end

  # PATCH/PUT /news/1 or /news/1.json
    def update
      respond_to do |format|
        if @news.number_of_editions < 5
          if @news.update(news_params)
            format.html { redirect_to @news, notice: t("activerecord.attributes.news.success_update") }
            format.json { render :show, status: :ok, location: @news }
            @news.number_of_editions += 1
            @news.save
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @news.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to @news, notice: t("activerecord.attributes.news.max_redaction" ) }
        end
      end
    end

  # DELETE /news/1 or /news/1.json
  def destroy
    NewsWithAcc.where(id_news: @news.id).destroy_all
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: t("activerecord.attributes.news.success_destroy") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:title, :content)
    end
end
