class Api::VotersController < ApplicationController
	before_action :set_voter, only: [:show, :update, :destroy]

	def stats
		@voters = Voter.stats
		render json: @voters
	end

	def index
		case
		when params.keys.include?('support')
			@voters = Voter.support
		when params.keys.include?('oppose')
			@voters = Voter.oppose
		when params.keys.include?('undecided')
			@voters = Voter.undecided
		else
			@voters = Voter.all
		end
		render json: @voters
	end

	def show
		render json: @voter
	end

	def create
		@voter = Voter.new(voter_params)
		@voter.address_string
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
		@voters = Voter.all.select{|v| !v.geocode.nil? }
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
			params.require(:voter).permit(:vote_preference, :street_number, :street_name, :city, :state, :postal_code, :address_string, :geocode)
		end
end
	