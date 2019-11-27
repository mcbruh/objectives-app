require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
    let(:new_user) { User.create!(username:"test_user", password:"password" ) }

    describe 'GET #new' do
        context 'when logged_in' do
            before do
                allow(controller).to receive(:current_user) {new_user}
            end

            it 'renders the new goals page' do
                get :new
                expect(response).to render_template('new')
                expect(response).to have_http_status(200)
            end
        end

        context 'when not logged_in' do
            before do
                allow(controller).to receive(:current_user) {nil}
            end

            it 'redirects to the new session page' do
                get :new
                expect(response).to redirect_to(new_session_url)
            end
        end
    end
end
