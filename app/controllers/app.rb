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
    erb :'songs/edit_view'
  end

  post '/songs' do
     song = Song.find(params["song"]["id"])
     song.update(title: params["song"]["title"], artist: params["song"]["artist"],
                  album: params["song"]["album"], genre: params["song"]["genre"], length: params["song"]["length"])
     redirect "/songs/#{params["song"]["id"]}"
  end


end
