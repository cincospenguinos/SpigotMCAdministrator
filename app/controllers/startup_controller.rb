class StartupController < ApplicationController
	include StartupHelper
	protect_from_forgery except: [ :running, :startup ]

	# GET /running
	def running
		is_running? ? msg = 'Server is running' : msg = 'Server is down'
		respond_to do |format|
			format.js { render :json => { running: is_running?, msg: msg } }
		end
	end

	# POST /startup
	def startup
		User u = User.find(username: startup_params[:username])
		success = u.password == startup_params[:password] && !is_running?

		success ? msg = 'Starting the server...' : msg = 'Cannot start. User params is wrong or server already running.'
		# TODO: Do this. Multithread it. Make it so that it's easy to startup the server.
		respond_to do |format|
			format.js { render :json => { success: success, msg: msg } }
		end
	end

	private

	def startup_params
		params.require(:startup).permit(:username, :password)
	end
end
