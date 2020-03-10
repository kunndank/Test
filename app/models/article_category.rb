class ArticleCategory < ApplicationRecord

	scope :active, -> { where(is_active: true)}

	has_many :articles
end
