require 'aloha/version'
require 'rubygems'
require 'savon'
require 'httpclient'

module Aloha
  class Soap
    attr_accessor :default_request, :default_setting, :client

    def initialize(params = {})
      gem_root = Gem::Specification.find_by_name('aloha').gem_dir
      @default_setting = YAML.load_file(gem_root + '/config/default_setting.yml')

      if params
        system_id = params[:system_id] if params[:system_id]
        company_id = params[:company_id] if params[:company_id]
        user_id = params[:user_id] if params[:user_id]
        account_password = params[:account_password] if params[:account_password]
        system_password = params[:system_password] if params[:system_password]
        wsdl_url = params[:wsdl_url] if params[:wsdl_url]

        @default_request = {'companyID' => company_id, 'userID' => user_id, 'password' => account_password} if company_id && user_id && account_password

        @client = Savon.client(soap_header: @default_request) do
          wsdl wsdl_url
          wsse_timestamp true
          wsse_auth system_id, system_password
          log true
          log_level :debug
          pretty_print_xml true
        end if  system_id && system_password
      end
    end

    #### addMemberProfile()
    def add_member_profile(params = {})
      request_params = {
        profile: {
          member_account_id: params[:member_account_id],
          card_number: params[:card_number],
          first_name: params[:first_name],
          last_name: params[:last_name],
          company: params[:company],
          date_of_birth: {
              date: params[:date_of_birth].blank? ? Date.today.to_s : params[:date_of_birth][:date].to_s || Date.today.to_s,
              locale: params[:date_of_birth].blank? ? 'en_US' : params[:date_of_birth][:locale].to_s || 'en_US'
          },
          anniversary_date: {
              date: params[:anniversary_date].blank? ? Date.today.to_s : params[:anniversary_date][:date].to_s || Date.today.to_s,
              locale: params[:anniversary_date].blank? ? 'en_US' : params[:anniversary_date][:locale].to_s || 'en_US'
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
      }
      request_params.merge!(default_request) if default_request


      client.call(:add_member_profile) do
        message(add_member_profile_request: request_params)
      end if client

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

      client.call(:adjust_credit) do
        message(adjust_credit_request: request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### getBonusPlanHistory()
    def get_bonus_plan_history(params = {})
      request_params = {
          card_number: params[:card_number],
          number_of_assignments: params[:number_of_assignments],
          number_of_days: params[:number_of_days],
          start_date: params[:start_date] || Date.today.to_s,
          end_date: params[:end_date] || Date.today.to_s
      }
      request_params.merge!(default_request) if default_request

      client.call(:get_bonus_plan_history) do
        message('GetBonusPlanHistoryRequest' => request_params)
      end if client

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

      client.call(:get_bonus_plan_standings) do
        message(get_bonus_plan_standings_request: request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### eMailExists()
    def email_exists(params = {})
      request_params = {
          e_mail_address: params[:email_address]
      }
      request_params.merge!(default_request) if default_request

      client.call(:e_mail_exists) do
        message(e_mail_exists_request: request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### getCardNumberByEmail()
    def get_card_number_by_email(params = {})
      request_params = {
        status: params[:account_status],
        email_address: params[:email_address]
      }
      request_params.merge!(default_request) if default_request

      client.call(:get_card_number_by_email) do
        message('GetCardNumberByEmailRequest' => request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### getCardNumberByPhone()
    def get_card_number_by_phone(params = {})
      request_params = {
        status: params[:account_status],
        phone_number: params[:phone_number]
      }
      request_params.merge!(default_request) if default_request

      @client.call(:get_card_number_by_phone) do
        message('GetCardNumberByPhoneRequest' => request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### getCardStatus()  
    def get_card_status(params = {})
      request_params = {
          card_number: params[:card_number]
      }
      request_params.merge!(default_request) if default_request

      client.call(:get_card_status) do
        message(get_card_status_request: request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### getMemberProfile()  
    def get_member_profile(params = {})
      request_params = {
          card_number: params[:card_number]
      }
      request_params.merge!(default_request) if default_request

      client.call(:get_member_profile) do
        message(get_member_profile_request: request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### phoneNumberExists() 
    def phone_number_exists(params = {})
      request_params = {
          phone_number: params[:phone_number]
      }
      request_params.merge!(default_request) if default_request

      client.call(:phone_number_exists) do
        message('PhoneNumberExistsRequest' => request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### updateMemberProfile()
    def update_member_profile(params = {})
      profile = default_setting['member_profile']
      request_params = {
        profile: {
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
          company_defined2: params[:company_defined2]
        }
      }
      request_params.merge!(default_request) if default_request

      client.call(:update_member_profile) do
        message(update_member_profile_request: request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### assignForgottenCard()
    def assign_forgotten_card(params = {})
      request_params = {
          card_number: params[:card_number],
          claim_ID: params[:claim_id]
      }
      request_params.merge!(default_request) if default_request

      client.call(:assign_forgotten_card) do
        message(assign_forgotten_card_request: request_params)
      end if client

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

      client.call(:get_check_detail) do
        message('GetCheckDetailRequest' => request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### activateNewCard ()
    def activate_new_card(params = {})
      request_params = {
          'batchID' => params[:batch_id]
      }
      request_params.merge!(default_request) if default_request

      client.call(:activate_new_card) do
        message('ActivateNewCardRequest' => request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### createVirtualCard()
    def create_virtual_card(params = {})
      request_params = {
          card_series: params[:card_series]
      }
      request_params.merge!(default_request) if default_request

      client.call(:create_virtual_card) do
        message('CreateVirtualCardResult' => request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### optOut()
    def opt_out(params = {})
      request_params = {
          card_number: params[:card_number]
      }
      request_params.merge!(default_request) if default_request

      client.call(:opt_out) do
        message(opt_out_request: request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### phoneNumberExists()
    def phone_number_exists(params = {})
      request_params = {
          phone_number: params[:phone_number]
      }
      request_params.merge!(default_request) if default_request

      client.call(:phone_number_exists) do
        message('PhoneNumberExistsRequest' => request_params)
      end if client

    rescue Savon::SOAPFault
    end

    ### newVirtualCard ()
    def new_virtual_card(params = {})
      request_params = {
          card_series: params[:card_series]
      }
      request_params.merge!(default_request) if default_request

      client.call(:new_virtual_card) do
        message('NewVirtualCardRequest' => request_params)
      end if client

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
      request_params.merge!(default_request) if default_request

      client.call(:create_new_card) do
        message('CreateNewCardRequest' => request_params)
      end if client

    rescue Savon::SOAPFault
    end
  end
end
