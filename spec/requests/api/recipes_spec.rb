require 'swagger_helper'

RSpec.describe 'api/recipes', type: :request do
  before do
    create(:recipe, title: "Test", time: 10, difficulty: "easy")
  end

  # jitera-hook-for-rswag-example

  path '/api/recipes/{id}' do
    delete 'Destroy recipes' do
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
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'integer',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:recipe).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes/{id}' do
    put 'Update recipes' do
      tags 'update'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :integer,
                example: 'integer'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
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
      response '200', 'update' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'integer',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_object' => {}

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:id) { create(:recipe).id }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes/{id}' do
    get 'Show recipes' do
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
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'integer',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:recipe).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes' do
    post 'Create recipes' do
      tags 'create'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :integer,
                example: 'integer'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
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
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'integer',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_object' => {}

        }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes' do
    get 'List recipes' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :integer,
                example: 'integer'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          },
          pagination_page: {
            type: :pagination_page,
            example: 'pagination_page'
          },
          pagination_limit: {
            type: :pagination_limit,
            example: 'pagination_limit'
          }
        }
      }
      response '200', 'filter' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'recipes' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'integer',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          }
        ],

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

  path '/api/recipes/search' do
    post 'Search recipes' do
      tags 'search'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },
              time: {
                type: :integer,
                example: 'integer'
              },
              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },
            }
          },
          pagination_page: {
            type: :pagination_page,
            example: 'pagination_page'
          },
          pagination_limit: {
            type: :pagination_limit,
            example: 'pagination_limit'
          }
        }
      }
      response '200', 'search' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'recipes' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'integer',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          }
        ],

            'user_id' => 'foreign_key'
          }
        ],
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }

        context "search by title" do
          let(:params) { { recipe_search: { title: "Test" } } }
          run_test! do |response|
            expect(JSON.parse(response.body)["recipes"][0]["title"]).to eq("Test")
          end
        end

        context "search by difficulty" do
          let(:params) { { recipe_search: { difficulty: "easy" } } }
          run_test! do |response|
            expect(JSON.parse(response.body)["recipes"][0]["difficulty"]).to eq("easy")
          end
        end

        context "search by time range" do
          let(:params) { { recipe_search: { time_range: { time_from: 10, time_to: 30 } } } }
          run_test! do |response|
            expect(JSON.parse(response.body)["recipes"][0]["time"]).to eq(10)
          end
        end

        context "No search results found" do
          let(:params) { { recipe_search: { title: "Another" } } }
          run_test! do |response|
            expect(JSON.parse(response.body).count).to eq(0)
          end
        end
      end
    end
  end
end
