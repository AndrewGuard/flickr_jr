# ===== GET ====================================

get '/' do
  # Look in app/views/index.erb
  erb :index
end

# handle the upload form
get '/upload' do
  erb :upload
end

get '/login' do
  erb :login
end

get '/users/new' do
  erb :create_user
end

get '/users/:user_id/albums' do
  @user = User.find(params[:user_id])
  @albums = @user.albums
  erb :album
end

get '/logout' do
  session.clear
  erb :index
end

get '/uploads/:album_id' do

  erb :photos
end

# ===== POST====================================

post '/upload_photo' do

  # @photo = Photo.create(album_id: params[:id], file: params[:filename])

  # @album = Album.find(params[:id])
  # @photo = Photo.new(filename: params[:filename])
  @photo = File.open(APP_ROOT + '/public/images' + "/uploads/params[:filename]", "w" ) do |f|
    f.write(params[:filename].read)
  end
  redirect to "/uploads/#{@album.id}"
end

#    WAT ?
post '/albums/:album_id' do
    photo = current_user.albums.find(params[:album_id]).photos.new()
    photo.file = params[:image]
    photo.save
end

post '/create_user' do
  user = User.create(name: params[:name], email: params[:email], password: params[:password])
  if user.authenticate(params[:password])
    user.albums << Album.create(name: 'first_album')
    session[:user_id] = user.id
    redirect to "/users/#{user.id }/albums"
  else
    @error = "Invalid email or password."
    erb :login
  end
end

post '/login' do
   user = User.find_by_email(params[:email])

   user.authenticate(params[:password])

   if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect to "/users/#{user.id}/albums"
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :login
  end
end

post '/upload' do
  File.open('uploads/' )
end









