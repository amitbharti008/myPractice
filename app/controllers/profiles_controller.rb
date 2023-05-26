class ProfilesController < ApplicationController


def create# byebug# user = User.find_by(id: params[: id])
profile = current_user.build_profile(profile_params)# profile = Profile.new(profile_params)
if profile.save# render json: {
    message: 'profile insert successfully'
}
render json: profile
else
    render json: {
        error: profile.errors.full_messages
    }, status::unprocessable_entity
end

end


def show

profile = current_user.profile
user = profile.user
render json: {
    profile: profile.as_json,
    user: user.as_json
}
end


def update

profile = current_user.profile
if profile.present ?
    profile.update(profile_params)
render json: {
    message: "profile update successfull"
}
else
    render json: {
        error: "profile not found for update"
    }
end
end

def index
profiles = Profile.all
render json: profiles


end


def destroy

profile = current_user.profile
if profile.present ?
    profile.destroy
render json: {
    message: " profile delete suceessfull"
}
else
    render json: {
        error: "profile not found for delete"
    }
end

end

private


def profile_params
params.require(: profiles).permit(: address,: phone_number,: city,: state,: country,: user_id)
end




end