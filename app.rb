class MessagesApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @messages = Message.all
    @body_class = "messages"
    
    erb :messages
  end

  post '/' do
    m = Message.new
    m.to = params[:to]
    m.from = params[:from]
    m.content = params[:content]
    m.save
  end
end
