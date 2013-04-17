module Dmap
  class Post < ActiveRecord::Base
  
  	extend FriendlyId
  	friendly_id :title, use: [:slugged, :history]
    
    belongs_to :category
    belongs_to :user, :polymorphic => true
    
    attr_accessible :active, :description, :description_short, :published_at, :slug, :state, :title
    attr_accessible :category_id, :user_id, :user_type, :tag_list

	acts_as_taggable

	validates :title, :description_short, :description, :presence => true

	before_save :check_published
	after_save :reindex_posts

	searchable :auto_index => true, :auto_remove => true do
		integer :id
		text :title, :boost => 5.0, :stored => true
		text :description_short, :boost => 2.0, :stored => true
		text :description, :stored => true

		text :post_contents do
		  post_contents.map(&:content)
		end

		text :languages do
		  languages.map(&:title)
		end

		text :post_tags do
		  tag_list.map { |t| t }.join(', ')
		end

		string :tag_list, :multiple => true, :stored => true

		time :created_at
		string :publish_month 
	end

	def publish_month
		created_at.strftime("%B")
	end

	def post_tags
		Post.tagged_with(params[:tag])
	end

	def self.recommended
		all
	end

	def reindex_posts
		Post.solr_reindex
	end

	def self.last_ones
		order("id DESC").limit(6)
	end

	def similar_posts
		search_str = tag_list.collect{ |i| i[0] }.join(" ")

		search = Post.search do
		  keywords search_str, :minimum_match => 3
		  without(:id, [self.id])
		  paginate :per_page => 5, :page => 1
		end

		search.results
	end 

  end
end
