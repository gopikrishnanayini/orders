class Api::V1::BaseController < ApplicationController

  private

  def pagination_details(object)
    pagination = {
      current_page: object.current_page,
      total_pages: object.total_pages,
      total_count: object.total_count
    }
    pagination = pagination.merge({prev_page: object.prev_page}) if object.page(object.current_page).prev_page.present?
    pagination = pagination.merge({next_page: object.next_page}) if object.page(object.current_page).next_page.present?
    return pagination
  end
end