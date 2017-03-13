get '/' do
  @display = Url.all
  erb :"static/index"
end
post '/urls' do
  @url = Url.create(params)
  redirect "/"
end

get '/:short_url' do
	@url = Url.find_by(short_url: params[:short_url])
	@url.counter += 1
	@url.save
	redirect "#{@url.long_url}"
end
