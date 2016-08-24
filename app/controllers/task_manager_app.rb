class TaskManagerApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/dashboard' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = task_manager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    task_manager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do
    @task = task_manager.find(params[:id].to_i)
    erb :show
  end

  get '/tasks/:id/edit' do
    @task = task_manager.find(params[:id].to_i)
    erb :edit
  end

  put '/tasks/:id' do
    task_manager.update(params[:id].to_i, params[:task])
    redirect "/tasks/#{params[:id]}"
  end

  delete '/tasks/:id' do
    task_manager.destroy(params[:id].to_i)
    redirect "/tasks"
  end

  # app/task_manager_app.rb
  def task_manager
    if ENV['RACK_ENV'] == "test"
      database = SQLite3::Database.new('db/task_manager_test.db')
    else
      database = SQLite3::Database.new('db/task_manager_development.db')
    end
    database.results_as_hash = true
    TaskManager.new(database)
  end

end
