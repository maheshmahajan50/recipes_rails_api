require 'swagger_helper'

RSpec.describe 'api/ingredients', type: :request do
  before do
    create(:ingredient)
  end

  # jitera-hook-for-rswag-example

  path '/api/ingredients/{id}' do
    delete 'Destroy ingredients' do
      tags 'delete'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'ingredients' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }
        let(:params) {}
        let(:id) { create(:ingredient).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ingredients/{id}' do
    put 'Update ingredients' do
      tags 'update'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ingredients: {
            type: :object,
            properties: {
              unit: {
                type: :float,
                example: 'float'
              },

              amount: {
                type: :float,
                example: 'float'
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
          'ingredients' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          },

          'error_object' => {}

        }
        let(:id) { create(:ingredient).id }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ingredients/{id}' do
    get 'Show ingredients' do
      tags 'show'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'ingredients' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }
        let(:params) {}
        let(:id) { create(:ingredient).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ingredients' do
    post 'Create ingredients' do
      tags 'create'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ingredients: {
            type: :object,
            properties: {
              unit: {
                type: :float,
                example: 'float'
              },

              amount: {
                type: :float,
                example: 'float'
              },

              recipe_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'ingredients' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

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

  path '/api/ingredients' do
    get 'List ingredients' do
      tags 'index'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ingredients: {
            type: :object,
            properties: {
              unit: {
                type: :float,
                example: 'float'
              },

              amount: {
                type: :float,
                example: 'float'
              },

              recipe_id: {
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
      response '200', 'index' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'ingredients' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          }
        ],

          'error_message' => 'string'

        }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ingredients/{id}/unit_conversion' do
    get 'Unit conversion for ingredients' do
      tags 'unit_conversion'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :unit_type, in: :query, schema: {
        type: :object,
        properties: {
          unit_type: {
            type: :string,
            example: 'string'
          }
        }
      }
      response '200', 'unit_conversion' do
        examples 'application/json' => {
          'ingredients' => {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'unit' => 'float',
            'unit' => 'enum_type',
            'amount' => 'float',
            'recipe_id' => 'foreign_key'
          },

          'error_message' => 'string'
        }

        let(:unit_type) { 'kilogram' }
        let(:id) { create(:ingredient, amount: 1000, unit: 'gram').id }

        run_test! do |response|
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)["amount"]).to eq(1.0)
        end
      end
    end
  end
end
