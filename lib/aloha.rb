require 'aloha/version'
require 'rubygems'
require 'savon'
require 'httpclient'

module Aloha
  gem_root = Gem::Specification.find_by_name('aloha').gem_dir
  @default_setting = YAML.load_file(gem_root + '/config/default_setting.yml')

  # Setting for soap client
  def self.soap_setting(params = {})
    if params
      system_id = params[:system_id] if params[:system_id]
      company_id = params[:company_id] if params[:company_id]
      user_id = params[:user_id] if params[:user_id]
      pwd = params[:pwd] if params[:pwd]
      password = params[:password] if params[:password]
      default_request = {'company_id' => company_id, 'userID' => user_id, 'password' => pwd}
      wsdl_url = params[:wsdl_url] if params[:wsdl_url]

      @client = Savon.client do
        wsdl wsdl_url
        wsse_timestamp true
        wsse_auth system_id, password
        log true
        log_level :debug
        pretty_print_xml true
      end if system_id && password && wsdl_url
    end
  end

  #### addMemberProfile()
  def self.add_member_profile(client, params = {})
    profile = @default_setting['member_profile']

    client.call(:add_member_profile) do
      message(add_member_profile_request: {
        profile: {
          member_account_id: params[:member_account_id] || profile['member_account_id'], # memberAccountID:int
          card_number: params[:card_number] || profile['card_number'], # cardNumber:String
          first_name: params[:first_name] || profile['first_name'],  # firstName:String
          last_name: params[:last_name] || profile['last_name'], # lastName:String
          company: params[:company] || profile['company'], # company:String
          date_of_birth: {
            date: params[:date_of_birth].blank? ? Date.today.to_s : params[:date_of_birth][:date].to_s || Date.today.to_s, # VanityDate date:String
            locale: params[:date_of_birth].blank? ? 'en_US' : params[:date_of_birth][:locale].to_s || 'en_US' # VanityDate locale:String
          },
          anniversary_date: {
            date: params[:anniversary_date].blank? ? Date.today.to_s : params[:anniversary_date][:date].to_s || Date.today.to_s,  # VanityDate date:String
            locale: params[:anniversary_date].blank? ? 'en_US' : params[:anniversary_date][:locale].to_s || 'en_US' # VanityDate locale:String
          },
          drivers_license: params[:drivers_license] || profile['drivers_license'], # driversLicense:String
          address1: params[:address1] || profile['address1'], # address1:String
          address2: params[:address2] || profile['address2'], # address2:String
          city: params[:city] || profile['city'], # city:String
          state_province: params[:state_province] || profile['state_province'], # stateProvince:String
          country: params[:country]|| profile['country'], # country:String
          postal_code: params[:postal_code] || profile['postal_code'], # postalCode:String
          email_address: params[:email_address] || profile['email_address'], # emailAddress:String
          phone_number: params[:phone_number] || profile['phone_number'], # phoneNumber:String
          other_phone_number: params[:other_phone_number] || profile['other_phone_number'], # otherPhoneNumber:String
          profile_exists: params[:profile_exists] # profileExists:Boolean
        }
      })
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### adjustCredit()
  def self.adjust_credit(client, params = {})
    adjust_credit = @default_setting['adjust_credit']

    client.call(:adjust_credit) do
      message(adjust_credit_request: {
        'cardNumber' => params[:card_number] || adjust_credit['card_number'], # cardNumber:String
        'BPID' => params[:bpid] || adjust_credit['bpid'], # BPID:Int
        'adjustmentType' => params[:adjustment_type] || adjust_credit['adjustment_type'], # adjustmentType:String
        'BPCredit' => params[:bp_credit] || adjust_credit['bp_credit'], # BPCredit:Int
        'reason' => params[:reason] || adjust_credit['reason'] # reason:String
      })
    end if client && (client.is_a?(Savon::Client))
  end

  ### getBonusPlanHistory()
  def self.get_bonus_plan_history(client, params = {})
    plan_history = @default_setting['get_bonus_plan_history']

    client.call(:get_bonus_plan_history) do
      message('GetBonusPlanHistoryRequest' => {
        card_number: params[:card_number] || plan_history['card_number'], # cardNumber:String
        number_of_assignments: params[:number_of_assignments] || plan_history['number_of_assignments'], # numberOfAssignments:Int
        number_of_days: params[:number_of_days] || plan_history[:number_of_days], # numberDfDays:Int
        start_date: params[:start_date] || Date.today.to_s, # startDate:String
        end_date: params[:end_date] || Date.today.to_s # endDate:String
      })
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### getBonusPlanStandings()
  def self.get_bonus_plan_standings(client, params = {})
    global = @default_setting['global']

    client.call(:get_bonus_plan_standings) do
      message(get_bonus_plan_standings_request: {
        card_number: params[:card_number] || global['card_number'], # cardNumber:String
        available_items_return: params[:available_items_return], #availableItemsReturn:Boolean
        purchased_items_return: params[:purchased_items_return] #purchasedItemsReturn:Boolean
      })
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### eMailExists()
  def self.email_exists(client, params = {})
    global = @default_setting['global']

    client.call(:e_mail_exists) do
      message(e_mail_exists_request: {e_mail_address: params[:e_mail_address] || global['email_address']}) # eMailAddress:String
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### getCardNumberByEmail()
  def self.get_card_number_by_email(client, params = {})
    global = @default_setting['global']

    client.call(:get_card_number_by_email) do
      message('GetCardNumberByEmailRequest' => {email_address: params[:email_address] || global['email_address']}) # emailAddress:String
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### getCardNumberByPhone()
  def self.get_card_number_by_phone(client, params = {})
    global = @default_setting['global']

    @client.call(:get_card_number_by_phone) do
      message('GetCardNumberByPhoneRequest' => {phone_number: params[:phone_number] || global['phone_number']}) # phoneNumber:String
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### getCardStatus()  
  def self.get_card_status(client, params = {})
    global = @default_setting['global']

    client.call(:get_card_status) do
      message(get_card_status_request: {card_number: params[:card_number] || global['card_number14']}) # cardNumber:String 14 digit
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### getMemberProfile()  
  def self.get_member_profile(client, params = {})
    global = @default_setting['global']

    client.call(:get_member_profile) do
      message(get_member_profile_request: {card_number: params[:card_number] || global['card_number14']}) # cardNumber:String 14 digit
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### phoneNumberExists() 
  def self.phone_number_exists(client, params = {})
    global = @default_setting['global']

    client.call(:phone_number_exists) do
      message('PhoneNumberExistsRequest' => {phone_number: params[:card_number] || global['phone_number']}) # phoneNumber:String
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### updateMemberProfile()
  def self.update_member_profile(client, params = {})
    profile = @default_setting['member_profile']

    client.call(:update_member_profile) do
      message(update_member_profile_request: {
        profile: {
          member_account_id: params[:member_account_id] || profile['member_account_id'], # memberAccountID:int
          card_number: params[:card_number] || profile['card_number'], # cardNumber:String
          first_name: params[:first_name] || profile['first_name'],  # firstName:String
          last_name: params[:last_name] || profile['last_name'], # lastName:String
          company: params[:company] || profile['company'], # company:String
          date_of_birth: {
            date: params[:date_of_birth].blank? ? Date.today.to_s : params[:date_of_birth][:date].to_s || Date.today.to_s, # VanityDate date:String
            locale: params[:date_of_birth].blank? ? 'en_US' : params[:date_of_birth][:locale].to_s || 'en_US' # VanityDate locale:String
          },
          anniversary_date: {
            date: params[:anniversary_date].blank? ? Date.today.to_s : params[:anniversary_date][:date].to_s || Date.today.to_s,  # VanityDate date:String
            locale: params[:anniversary_date].blank? ? 'en_US' : params[:anniversary_date][:locale].to_s || 'en_US' # VanityDate locale:String
          },
          drivers_license: params[:drivers_license] || profile['drivers_license'],
          address1: params[:address1] || profile['address1'], # address1:String
          address2: params[:address2] || profile['address2'], # address2:String
          city: params[:city] || profile['city'], # city:String
          state_province: params[:state_province] || profile['state_province'], # stateProvince:String
          country: params[:country]|| profile['country'], # country:String
          postal_code: params[:postal_code] || profile['postal_code'], # postalCode:String
          email_address: params[:email_address] || profile['email_address'], # emailAddress:String
          phone_number: params[:phone_number] || profile['phone_number'], # phoneNumber:String
          other_phone_number: params[:other_phone_number] || profile['other_phone_number'], # otherPhoneNumber:String
          profile_exists: params[:profile_exists] # profileExists:Boolean
        }
      })
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### assignForgottenCard()
  def self.assign_forgotten_card(client, params = {})
    global = @default_setting['global']

    client.call(:assign_forgotten_card) do
      message(assign_forgotten_card_request: {
          card_number: params[:card_number] || global['card_number'], # cardNumber:String
          claim_ID: params[:claim_id] || global['claim_id'] # claimID:String
      })
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end

  ### getCheckDetail()
  def self.get_check_detail(client, params = {})
    global = @default_setting['global']

    client.call(:get_check_detail) do
      message('GetCheckDetailRequest' => {
        claim_ID: params[:claim_id] || global['claim_id'], # claimID:String
        store_ID: params[:store_id] || global['store_id'], # store_ID:Int
        date_of_business: params[:date_of_business] || Date.today.to_s # dateOfBusiness:String
      })
    end if client && (client.is_a?(Savon::Client))

  rescue Savon::SOAPFault
  end
end
