# frozen_string_literal: true

class IpMaskingJob < ApplicationJob
  queue_as :default

  def perform(id)
    ip_address = IpAddress.find(id)
    return if ip_address.proxy || ip_address.country.present?

    resp = reverse_ip(ip_address.ip_address)
    ip_address.country = resp['country_name']
    ip_address.city = resp['city']
    ip_address.code = resp['country_code']
    ip_address.save!
  end

  def reverse_ip(ip)
    uri = URI.parse("http://api.ipstack.com/#{ip}?access_key=xxxx")
    response = Net::HTTP.get_response(uri)
    return nil if response.code != '200'

    JSON.parse(response.body)
  end
end
