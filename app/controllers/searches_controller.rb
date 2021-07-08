class SearchesController < ApplicationController

	def search
		# byebug
		@model = params["model"]
		@content = params["content"]
		@method = params["method"]

		@records = search_for(@model, @content, @method)

	end

	private

	def search_for(model, content, method)
		if model == "user"
			if method == "perfect"
				User.where(name: content)
			elsif method == "front"
				User.where('name LIKE ?', content+'%')
			elsif method == "back"
				User.where.('name LIKE ?', '%'+content)
			else
				User.where('name LIKE ?', '%'+content+'%')
				# モデルクラス.where(条件式)
				# モデルクラス.where("カラム名 LIKE?", "検索したい文字列")
				# '%'+content+'%'は「+」を使ってで文字列を結合させている
			end
		elsif model == 'book'
			if method == 'perfect'
				Book.where(title: content)
			elsif method == "front"
				Book.where('title LIKE ?', content+'%')
			elsif method == "back"
				Book.where('title LIKE ?', '%'+content)
			else
				Book.where('title LIKE ?', '%'+content+'%')
			end
		end
	end

end
