module Aloha
  module Helper

    def self.aloha_soap_result(response, operation)
      if response
        #OpenStruct.new(response.to_hash[(operation.to_s+'_response').to_sym][(operation.to_s+'_result').to_sym])
        return response
      end
    end

    def self.member_profile(params)
      hash_params = {}
      hash_params[:member_account_id] = params[:member_account_id] unless params[:member_account_id].blank?
      hash_params[:card_number] = params[:card_number] unless params[:card_number].blank?
      hash_params[:first_name] = params[:first_name] unless params[:first_name].blank?
      hash_params[:last_name] = params[:last_name] unless params[:last_name].blank?
      hash_params[:company] = params[:company] unless params[:company].blank?
      unless params[:date_of_birth].blank?
        hash_params[:date_of_birth] = {}
        hash_params[:date_of_birth][:date] = params[:date_of_birth][:date] unless params[:date_of_birth][:date].blank?
        hash_params[:date_of_birth][:locale]  = 'en_US'
      end
      unless params[:anniversary_date].blank?
        hash_params[:anniversary_date] = {}
        hash_params[:anniversary_date][:date] = params[:anniversary_date][:date] unless params[:anniversary_date][:date].blank?
        hash_params[:anniversary_date][:locale]  = 'en_US'
      end
      hash_params[:drivers_license] = params[:drivers_license] unless params[:drivers_license].blank?
      hash_params[:address1] = params[:address1] unless params[:address1].blank?
      hash_params[:address2] = params[:address2] unless params[:address2].blank?
      hash_params[:city] = params[:city] unless params[:city].blank?
      hash_params[:state_province] = params[:state_province] unless params[:state_province].blank?
      hash_params[:country] = params[:country] unless params[:country].blank?
      hash_params[:postal_code] = params[:postal_code] unless params[:postal_code].blank?
      hash_params[:email_address] = params[:email_address] unless params[:email_address].blank?
      hash_params[:phone_number] = params[:phone_number] unless params[:phone_number].blank?
      hash_params[:other_phone_number] = params[:other_phone_number] unless params[:other_phone_number].blank?
      hash_params[:profile_exists] = params[:profile_exists] unless params[:profile_exists].blank?
      hash_params[:company_defined1] = params[:company_defined1] unless params[:company_defined1].blank?
      hash_params[:company_defined2] = params[:company_defined2] unless params[:company_defined2].blank?
      hash_params[:company_defined3] = params[:company_defined3] unless params[:company_defined3].blank?
      hash_params[:company_defined4] = params[:company_defined4] unless params[:company_defined4].blank?
      hash_params[:company_defined5] = params[:company_defined5] unless params[:company_defined5].blank?
      hash_params[:company_defined6] = params[:company_defined6] unless params[:company_defined6].blank?
      hash_params[:company_defined7] = params[:company_defined7] unless params[:company_defined7].blank?
      hash_params[:company_defined8] = params[:company_defined8] unless params[:company_defined8].blank?
      hash_params[:company_defined9] = params[:company_defined9] unless params[:company_defined9].blank?
      hash_params[:company_defined10] = params[:company_defined10] unless params[:company_defined10].blank?
      hash_params[:company_defined11] = params[:company_defined11] unless params[:company_defined11].blank?
      hash_params[:company_defined12] = params[:company_defined12] unless params[:company_defined12].blank?
      hash_params[:company_defined13] = params[:company_defined13] unless params[:company_defined13].blank?
      hash_params[:company_defined14] = params[:company_defined14] unless params[:company_defined14].blank?
      hash_params[:company_defined15] = params[:company_defined15] unless params[:company_defined15].blank?
      hash_params[:company_defined16] = params[:company_defined16] unless params[:company_defined16].blank?
      hash_params[:company_defined17] = params[:company_defined17] unless params[:company_defined17].blank?
      hash_params[:company_defined18] = params[:company_defined18] unless params[:company_defined18].blank?
      hash_params[:company_defined19] = params[:company_defined19] unless params[:company_defined19].blank?
      hash_params[:company_defined20] = params[:company_defined20] unless params[:company_defined20].blank?
      hash_params[:company_defined21] = params[:company_defined21] unless params[:company_defined21].blank?
      hash_params[:company_defined22] = params[:company_defined22] unless params[:company_defined22].blank?
      hash_params[:company_defined23] = params[:company_defined23] unless params[:company_defined23].blank?
      hash_params[:company_defined24] = params[:company_defined24] unless params[:company_defined24].blank?
      hash_params[:company_defined25] = params[:company_defined25] unless params[:company_defined25].blank?
      hash_params[:company_defined26] = params[:company_defined26] unless params[:company_defined26].blank?
      hash_params[:company_defined27] = params[:company_defined27] unless params[:company_defined27].blank?
      hash_params[:company_defined28] = params[:company_defined28] unless params[:company_defined28].blank?
      hash_params[:company_defined29] = params[:company_defined29] unless params[:company_defined29].blank?
      hash_params[:company_defined30] = params[:company_defined30] unless params[:company_defined30].blank?

      return hash_params
    end
  end
end