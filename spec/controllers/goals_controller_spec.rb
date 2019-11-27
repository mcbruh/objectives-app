require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
    let(:new_user) {User.create!(username:"test_user", password:"password")}

    describe 'GET #new' do
        context 'when logged in' do
            before do
                allow(controller).to receive(:current_user) {new_user}
            end

            it 'renders the new goals page' do
                get :new
                expect(response).to render_template('new')
                expect(response).to have_http_status(200)
            end
        end

        context 'when not logged in' do
            before do
                allow(controller).to receive(:current_user) {nil}
            end

            it 'redirects to the new session page' do
                get :new
                expect(response).to redirect_to(new_session_url)
            end
        end
    end

    describe 'POST #create' do
        let(:new_user) {User.create!(username:"test_user", password:"password")}
        context 'when logged in' do
            before do
                allow(controller).to receive(:current_user) {new_user}
            end
            
            context 'with valid params' do
                it 'redirects to the goal show page' do
                    post :create, params: { goal: { title: 'test goal', details: 'will this work'} }
                    expect(response).to redirect_to(goal_url(Goal.last))
                end
            end
            
            context 'with bad params' do
                it 'redirects to the new goal page' do
                    post :create, params: { goal: { title: 'bad_goal'} }
                    expect(response).to render_template('new')
                    expect(flash[:errors]).to be_present
                end
            end
        end

        context 'when not logged in' do
            before do
                allow(controller).to receive(:current_user) {nil}
            end
            it 'redirects to new session page' do
                get :new
                expect(response).to redirect_to(new_session_url)
            end
        end
    end
end
