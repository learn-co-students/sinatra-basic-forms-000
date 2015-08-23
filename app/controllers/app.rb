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
    song = Song.find(params[:id])
    @song.update_attributes(params[:song])
  # redirect to("/songs/#{@song.id}")
    erb :'songs/show'
  end

  # post '/songs/:id/edit' do
  #   @song = Song.find(params[:id])
  #   song = Song.find(params[:id])
  #   @song.update_attributes(params[:song])
  #   redirect to("/songs/#{@song.id}")
  # end
  
end

