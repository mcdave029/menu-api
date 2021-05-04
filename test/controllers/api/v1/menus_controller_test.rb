require 'test_helper'

class Api::V1::MenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @json_parameters = [
      {
        "menu":{
          "header":"menu",
          "items":[
            {
              "id":27
            },
            {
              "id":0,
              "label":"Label 0"
            },
            nil,
            {
              "id":93
            },
            {
              "id":85
            },
            {
              "id":54
            },
            nil,
            {
              "id":46,
              "label":"Label 46"
            }
          ]
        }
      },
      {
        "menu":{
          "header":"menu",
          "items":[
            {
              "id":81
            }
          ]
        }
      },
      {
        "menu":{
          "header":"menu",
          "items":[
            {
              "id":70,
              "label":"Label 70"
            },
            {
              "id":85,
              "label":"Label 85"
            },
            {
              "id":93,
              "label":"Label 93"
            },
            {
              "id":2
            }
          ]
        }
      }
    ].to_json
  end

  test 'should get calculate_ids with valid status' do
    get calculate_ids_api_v1_menus_url, params: { menus: @json_parameters }
    assert_response :success
    body = JSON.parse response.body
    assert_equal body["result"], [46,0,248]
    assert_equal body["message"], "Successfully calculated all the IDs in menu." 
  end

  test 'should get calculate_ids with empty menus' do
    get calculate_ids_api_v1_menus_url, params: { menus: [].to_json }
    assert_response :success
    body = JSON.parse response.body
    assert_equal body["result"], []
    assert_equal body["message"], "Successfully calculated all the IDs in menu."
  end

  test 'should get calculate_ids with invalid params' do
    get calculate_ids_api_v1_menus_url, params: { menus: [] }
    assert_response 422
    body = JSON.parse response.body
    assert_equal body["result"], []
    assert_equal body["message"], "no implicit conversion of Array into String"
  end
end
