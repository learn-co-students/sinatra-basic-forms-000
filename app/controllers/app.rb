class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do
  	@song = Song.find(params[:id])
  	erb :'songs/edit'
  end

  post '/songs/:id' do
  	@song = Song.find(params[:id])
  	attributes = Song.attribute_names - ['id']
    attributes.each do |attribute|
      @song[attribute] = params["song"][attribute]
    end
    @song.save

    erb :'songs/show'
  end
  
end

