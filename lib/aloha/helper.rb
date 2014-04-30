module Aloha
  module Helper

    def self.aloha_soap_result(response, operation)
      if response
        OpenStruct.new(response.to_hash[(operation.to_s+'_response').to_sym][(operation.to_s+'_result').to_sym])
      end
    end

    def self.member_profile(params)
      {
        member_account_id: params[:member_account_id],
        card_number: params[:card_number],
        first_name: params[:first_name],
        last_name: params[:last_name],
        company: params[:company],
        date_of_birth: {
          date: params[:date_of_birth].blank? ? Date.today.to_s : params[:date_of_birth][:date].to_s || Date.today.to_s, # VanityDate date:String
          locale: params[:date_of_birth].blank? ? 'en_US' : params[:date_of_birth][:locale].to_s || 'en_US' # VanityDate locale:String
        },
        anniversary_date: {
          date: params[:anniversary_date].blank? ? Date.today.to_s : params[:anniversary_date][:date].to_s || Date.today.to_s,  # VanityDate date:String
          locale: params[:anniversary_date].blank? ? 'en_US' : params[:anniversary_date][:locale].to_s || 'en_US' # VanityDate locale:String
        },
        drivers_license: params[:drivers_license],
        address1: params[:address1],
        address2: params[:address2],
        city: params[:city],
        state_province: params[:state_province],
        country: params[:country],
        postal_code: params[:postal_code],
        email_address: params[:email_address],
        phone_number: params[:phone_number],
        other_phone_number: params[:other_phone_number],
        profile_exists: params[:profile_exists]
      }
    end
  end
end