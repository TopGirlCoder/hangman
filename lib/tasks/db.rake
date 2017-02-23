namespace :db do 
	task all: [:drop, :create, :migrate] do
	end
end	 