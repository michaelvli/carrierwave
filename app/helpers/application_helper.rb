module ApplicationHelper

	def thumb(url)
		url = url.rpartition(".")[0].to_s + ".png"
		return url
	end

end
