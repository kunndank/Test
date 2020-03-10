class Article < ApplicationRecord

	scope :published, -> { where(:state => "Published")}

	belongs_to :article_category
	belongs_to :user

	state_machine :state , :initial => :new do
	    state :drafted , :value => "Drafted"
	    state :published , :value=> "Published"
	    state :archived , :value => "Archived"
	    
	    
	    event :draft_article do 
	      transition [:new] => :draft
	    end

	    event :publish_article do 
	      transition [:new,:drafted] => :published
	    end

	    event :archive_article do 
	      transition [:drafted,:published] => :archived
	    end
	end

	def archive_articles articles
		articles.each do |article|
			article.archive_article
		end		
	end

	def publish_articles articles
		articles.each do |article|
			article.publish_article
		end		
	end
end
