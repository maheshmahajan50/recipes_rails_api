require 'swagger_helper'

RSpec.describe 'api/ratings', type: :request do
  before do
    create(:rating)
  end

  path '/api/ratings/{id}' do
    delete 'Destroy ratings' do
      tags 'delete'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'ratings' => {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'rate' => 'integer',
            'user_id' => 'foreign_key',
            'recipe_id' => 'foreign_key'
          },
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }

        context 'with authorized user' do
          let(:params) {}
          let(:id) { create(:rating, user_id: resource_owner.id).id }

          run_test! do |response|
            expect(response.status).to eq(200)
          end
        end

        context 'with unauthorized user' do 
          let(:params) {}
          let(:id) { create(:rating).id }

          run_test! do |response|
            expect(JSON.parse(response.body)["error_object"]).to eq('Unauthorized user to perform this action')
          end
        end
      end
    end
  end

  path '/api/ratings/{id}' do
    put 'Update rating' do
      tags 'update'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ratings: {
            type: :object,
            properties: {
              rate: {
                type: :integer,
                example: 'integer'
              },
              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },
              recipe_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }
            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'ratings' => {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'rate' => 'integer',
            'recipe_id' => 'foreign_key',
            'user_id' => 'foreign_key'
          },
          'error_object' => {}
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }

        context 'with authorized user' do 
          let(:rating) { create(:rating, rate: 5, user_id: resource_owner.id) }
          let(:id) { rating.id }
          let(:params) { { rating: { rate: 2 } } }

          run_test! do |response|
            expect(response.status).to eq(200)
            expect(JSON.parse(response.body)["rating"]["rate"]).to eq(2)
          end
        end

        context 'with unauthorized user' do 
          let(:rating) { create(:rating, rate: 5) }
          let(:id) { rating.id }
          let(:params) { { rating: { rate: 2 } } }

          run_test! do |response|
            expect(JSON.parse(response.body)["error_object"]).to eq('Unauthorized user to perform this action')
          end
        end
      end
    end
  end

  path '/api/ratings/{id}' do
    get 'Show ratings' do
      tags 'show'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'ratings' => {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'rate' => 'integer',
            'recipe_id' => 'foreign_key',
            'user_id' => 'foreign_key'
          },
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:rating).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ratings' do
    post 'Create ratings' do
      tags 'create'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ratings: {
            type: :object,
            properties: {
              rate: {
                type: :integer,
                example: 'integer'
              },
              recipe_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },
              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }
            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'ratings' => {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'rate' => 'integer',
            'recipe_id' => 'foreign_key',
            'user_id' => 'foreign_key'
          },
          'error_object' => {}
        }

        let(:params) { { rating: { user_id: 1, recipe_id: 1, rate: 2 } } }
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ratings' do
    get 'List ratings' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ratings: {
            type: :object,
            properties: {
              rate: {
                type: :integer,
                example: 'integer'
              },
              descriptions: {
                type: :text,
                example: 'text'
              },
              recipe_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },
              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }
            }
          }
        }
      }

      response '200', 'index' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'ratings' =>
        [
          {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'rate' => 'integer',
            'recipe_id' => 'foreign_key',
            'user_id' => 'foreign_key'
          }
        ],
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
