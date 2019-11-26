require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do
        it 'renders the new users page' do
            # this line simulates a "GET" request to the UsersController 
            # that hits the #new method, passing in `{user: {}}` as params.
            get :new, {}

            # here we check to make sure that the response renders back
            # the new template
            expect(response).to render_template('new')
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST #create' do
        context 'with invalid params' do
            it 'validates the presence of username and password' do
                post :create, params: { user: { username: 'bad_user'} }
                expect(response).to render_template('new')
                expect(flash[:errors]).to be_present
            end
        end

        context 'with valid params' do
            it 'redirects to the user show page' do
                post :create, params: { user: { username: 'testuser', password: 'good_password' } }
                expect(response).to redirect_to(user_url(User.last))
            end
        end
    end
end
