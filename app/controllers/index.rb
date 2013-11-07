# ===== GET ====================================

get '/' do
  # Look in app/views/index.erb
  erb :index
end

# ===== POST====================================

post '/albums/:album_id' do
    photo = current_user.albums.find(params[:album_id]).photos.new()
    photo.file = params[:image]
    photo.save
end