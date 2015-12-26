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

  post '/songs/:id/update' do
    @song = Song.find(params[:id])
    @song.update(params[:song])
    redirect to("/songs/#{params[:id]}")
  end

end

