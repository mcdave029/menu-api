class Api::V1::MenusController < ApplicationController
  def calculate_ids
    render json: {
      result: JSON.parse(params["menus"]).map(&sum_ids).compact,
      message: "Successfully calculated all the IDs in menu."
    }.to_json,
    status: :ok
  rescue StandardError => e
    render json: {
      result: [],
      message: e.message
    }.to_json,
    status: :unprocessable_entity
  end

  private

  def items_id
    lambda do |item|
      return item["id"].to_i if item.present? && item.key?("label") 

      0
    end
  end

  def sum_ids
    lambda do |obj|
      obj.dig(*%w[menu items])&.sum(&items_id)
    end
  end

  def parsed_params
  end
end
