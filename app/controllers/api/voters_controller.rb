class Api::VotersController < ApplicationController
	before_action :set_voter, only: [:show, :update, :destroy]
	
		def index
			@voters = Voter.all
			render json: @voters
		end
	
		def show
			render json: @voter
		end
	
		def create
			@voter = Voter.new(voter_params)
			if @voter.save
				render json: @voter
			else
				render json: {message: "Voter NOT created.", params_received: params}
			end
		end
	
		def update
			if @voter.update(voter_params)
				render json: @voter
			else
				render json: {message: "Voter NOT updated.", params_received: params}
			end
		end
	
		def destroy
			@voter.delete
			render json: {message: "Voter deleted.", params_received: params}
		end
	
		def markers
			@voters = Voter.all.select{|v| v.lat != "0"}
			if @voters.count == 0
				render json: {message: "no voter locations yet"}
			else
				render json: @voters 
			end
		end
		
		private
			def set_voter
				@voter = Voter.find_by(id: params[:id])
				render json: @voter
			end
	
			def voter_params
				params.require(:voter).permit(:vote_preference, :street_number, :street_name, :city, :state, :postal_code, :address_string, :lat, :lng)
			end
	end
	