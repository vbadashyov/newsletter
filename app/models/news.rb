class News < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  def create_new_news
    News.create(title: '123', content: '12313').save()
  end
end
