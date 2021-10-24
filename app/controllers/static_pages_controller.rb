class StaticPagesController < ApplicationController
  def index
    current_account_id = current_account.id
    acc = Account.where(id:current_account_id)
    # NewsMailer.send_newsletter(News.all, acc[0]).deliver
    # ids_news = []
    # for record in NewsWithAcc.where(id_acc: current_account_id)
    #   ids_news.push record.id_news
    # end
    # @news = News.where(id: ids_news)
    @news = News.all
    if @news == []
      @news = 0
    end

    @type_digest = acc[0].digest
    # byebug
  end

  def update
    respond_to do |format|
      Account.where(id: current_account.id).update(digest: params.require(:digest))
      format.json { render :show, status: :ok}
    end
  end
end
