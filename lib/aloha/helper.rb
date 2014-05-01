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
        profile_exists: params[:profile_exists],
        company_defined1: params[:company_defined1],
        company_defined2: params[:company_defined2],
        company_defined3: params[:company_defined3],
        company_defined4: params[:company_defined4],
        company_defined5: params[:company_defined5],
        company_defined6: params[:company_defined6],
        company_defined7: params[:company_defined7],
        company_defined8: params[:company_defined8],
        company_defined9: params[:company_defined9],
        company_defined10: params[:company_defined10],
        company_defined11: params[:company_defined11],
        company_defined12: params[:company_defined12],
        company_defined13: params[:company_defined13],
        company_defined14: params[:company_defined14],
        company_defined15: params[:company_defined15],
        company_defined16: params[:company_defined16],
        company_defined17: params[:company_defined17],
        company_defined18: params[:company_defined18],
        company_defined19: params[:company_defined19],
        company_defined20: params[:company_defined20],
        company_defined21: params[:company_defined21],
        company_defined22: params[:company_defined22],
        company_defined23: params[:company_defined23],
        company_defined24: params[:company_defined24],
        company_defined25: params[:company_defined25],
        company_defined26: params[:company_defined26],
        company_defined27: params[:company_defined27],
        company_defined28: params[:company_defined28],
        company_defined29: params[:company_defined29],
        company_defined30: params[:company_defined30]
      }
    end
  end
end