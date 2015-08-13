require 'aloha/version'
require 'aloha/helper'
require 'rubygems'
require 'savon'
require 'httpclient'

module Aloha
  class Soap
    attr_accessor :default_request, :client

    def initialize(params = {})
      #gem_root = Gem::Specification.find_by_name('aloha').gem_dir
      #default_setting = OpenStruct.new(YAML.load_file(gem_root + '/config/default_setting.yml'))

      system_id = params[:system_id]# || default_setting.system_id
      company_id = params[:company_id]# || default_setting.company_id
      user_id = params[:user_id]# || default_setting.user_id
      account_password = params[:account_password]# || default_setting.account_password
      system_password = params[:system_password]# || default_setting.system_password
      wsdl_url = params[:wsdl_url]# || default_setting.wsdl_url
      ssl_version = params[:ssl_version] || :SSLv3
      @default_request = {'companyID' => company_id, 'userID' => user_id, 'password' => account_password} if company_id && user_id && account_password

      @client = Savon.client(soap_header: @default_request) do
        wsdl wsdl_url
        wsse_timestamp true
        wsse_auth system_id, system_password
        log true
        log_level :error
        #pretty_print_xml true
        ssl_version ssl_version
      end if  system_id && system_password
    end

    #### addMemberProfile()
    def add_member_profile(params = {})
      request_params = {
          profile: Aloha::Helper.member_profile(params)
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:add_member_profile) do
        message(add_member_profile_request: request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :add_member_profile)

    rescue Savon::SOAPFault
    end

    ### adjustCredit()
    def adjust_credit(params = {})
      request_params = {
          'cardNumber' => params[:card_number],
          'BPID' => params[:bpid],
          'adjustmentType' => params[:adjustment_type],
          'BPCredit' => params[:bp_credit],
          'reason' => params[:reason]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:adjust_credit) do
        message(adjust_credit_request: request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :adjust_credit)

    rescue Savon::SOAPFault
    end

    ### getBonusPlanHistory()
    def get_bonus_plan_history(params = {})
      request_params = { card_number: params[:card_number] }
      request_params.merge!(number_of_assignments: params[:number_of_assignments]) if params[:number_of_assignments]
      request_params.merge!(number_of_days: params[:number_of_days]) if params[:number_of_days]
      request_params.merge!(start_date: params[:start_date]) if params[:start_date]
      request_params.merge!(end_date: params[:end_date]) if params[:end_date]
      request_params.merge!(default_request) if default_request

      response = client.call(:get_bonus_plan_history) do
        message('GetBonusPlanHistoryRequest' => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :get_bonus_plan_history)

    rescue Savon::SOAPFault
    end

    ### getBonusPlanStandings()
    def get_bonus_plan_standings(params = {})
      request_params = {
          card_number: params[:card_number],
          available_items_return: params[:available_items_return],
          purchased_items_return: params[:purchased_items_return]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:get_bonus_plan_standings) do
        message(get_bonus_plan_standings_request: request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :get_bonus_plan_standings)

    rescue Savon::SOAPFault
    end

    ### eMailExists()
    def email_exists(params = {})
      request_params = {
          e_mail_address: params[:email_address]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:e_mail_exists) do
        message(e_mail_exists_request: request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :e_mail_exists)

    rescue Savon::SOAPFault
    end

    ### getCardNumberByEmail()
    def get_card_number_by_email(params = {})
      request_params = {
          status: params[:account_status],
          email_address: params[:email_address]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:get_card_number_by_email) do
        message('GetCardNumberByEmailRequest' => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :get_card_number_by_email)

    rescue Savon::SOAPFault
    end

    ### getCardNumberByPhone()
    def get_card_number_by_phone(params = {})
      request_params = {
          status: params[:account_status],
          phone_number: params[:phone_number]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:get_card_number_by_phone) do
        message('GetCardNumberByPhoneRequest' => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :get_card_number_by_phone)

    rescue Savon::SOAPFault
    end

    ### getCardStatus()  
    def get_card_status(params = {})
      request_params = {
          card_number: params[:card_number]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:get_card_status) do
        message(get_card_status_request: request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :get_card_status)

    rescue Savon::SOAPFault
    end

    ### getMemberProfile()  
    def get_member_profile(params = {})
      request_params = {
          card_number: params[:card_number]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:get_member_profile) do
        message(get_member_profile_request: request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :get_member_profile)

    rescue Savon::SOAPFault
    end

    ### phoneNumberExists() 
    def phone_number_exists(params = {})
      request_params = {
          phone_number: params[:phone_number]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:phone_number_exists) do
        message('PhoneNumberExistsRequest' => request_params)
      end if client

      Aloha::Helper.aloha_soap_result(response, :phone_number_exists)
    rescue Savon::SOAPFault
    end

    ### updateMemberProfile()
    def update_member_profile(params = {})
      request_params = {
          profile: Aloha::Helper.member_profile(params)
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:update_member_profile) do
        message(update_member_profile_request: request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :update_member_profile)

    rescue Savon::SOAPFault
    end

    ### assignForgottenCard()
    def assign_forgotten_card(params = {})
      request_params = {
          card_number: params[:card_number],
          claim_ID: params[:claim_id]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:assign_forgotten_card) do
        message(assign_forgotten_card_request: request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :assign_forgotten_card)

    rescue Savon::SOAPFault
    end

    ### getCheckDetail()
    def get_check_detail(params = {})
      request_params = {
          claim_ID: params[:claim_id],
          store_ID: params[:store_id],
          date_of_business: params[:date_of_business] || Date.today.to_s
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:get_check_detail) do
        message('GetCheckDetailRequest' => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :get_check_detail)

    rescue Savon::SOAPFault
    end

    ### activateNewCard ()
    def activate_new_card(params = {})
      request_params = {
          'batchID' => params[:batch_id]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:activate_new_card) do
        message('ActivateNewCardRequest' => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :activate_new_card)

    rescue Savon::SOAPFault
    end

    ### createVirtualCard()
    def create_virtual_card(params = {})
      request_params = {
          card_series: params[:card_series]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:create_virtual_card) do
        message('CreateVirtualCardResult' => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :create_virtual_card)

    rescue Savon::SOAPFault
    end

    ### optOut()
    def opt_out(params = {})
      request_params = {
          card_number: params[:card_number]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:opt_out) do
        message(opt_out_request: request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :opt_out)

    rescue Savon::SOAPFault
    end

    ### phoneNumberExists()
    def phone_number_exists(params = {})
      request_params = {
          phone_number: params[:phone_number]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:phone_number_exists) do
        message('PhoneNumberExistsRequest' => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :phone_number_exists)

    rescue Savon::SOAPFault
    end

    ### newVirtualCard ()
    def new_virtual_card(params = {})
      request_params = {
          card_series: params[:card_series]
      }
      request_params.merge!(default_request) if default_request

      response = client.call(:new_virtual_card) do
        message('NewVirtualCardRequest' => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :new_virtual_card)

    rescue Savon::SOAPFault
    end

    ### createNewCard()
    def create_new_card(params = {})
      request_params = {
          activate_card: params[:activate_card],
          batch_desc: params[:batch_desc],
          'batchID' => params[:batch_id],
          card_series: params[:card_series],
          number_of_cards: params[:number_of_cards],
          numeric_sequence_type: params[:numeric_sequence_type],
          starting_card_number: params[:starting_card_number]
      }
      response = request_params.merge!(default_request) if default_request

      client.call(:create_new_card) do
        message('CreateNewCardRequest' => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :create_new_card)

    rescue Savon::SOAPFault
    end

    def get_dynamic_comp_balance(params = {})
      request_params = {
          card_number: params[:card_number]
      }
      request_params.merge!(default_request) if default_request
      response = client.call(:get_dynamic_comp_balance) do
        message("GetDynamicCompBalanceRequest" => request_params)
      end if client
      Aloha::Helper.aloha_soap_result(response, :get_dynamic_comp_balance)

    rescue Savon::SOAPFault
    end

  end
end