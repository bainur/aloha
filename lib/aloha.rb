require 'aloha/version'
require 'rubygems'
require 'savon'
require 'httpclient'

module Aloha

  system_id = 'rr39261'
  company_id = 'RDS11'
  user_id = 'Web.Service'
  pwd = 'LoyaltyAPI1'
  password='!069158823A'
  default_request = {'company_id' => company_id, 'userID' => user_id, 'password' => pwd}
  wsdl_url = 'https://memberlinkWS.alohaenterprise.com/insightws/MemberLinkWS?wsdl'

  @client = Savon.client do
    wsdl wsdl_url
    wsse_timestamp true
    wsse_auth system_id, password
    log true
    log_level :debug
    pretty_print_xml true
  end

  #### addMemberProfile()
  def self.add_member_profile(params = {})
    @client.call(:add_member_profile) do
      message(add_member_profile_request: {
        profile: {
          member_account_id: params[:member_account_id] || 1, # memberAccountID:int
          card_number: params[:card_number] || '424242424242', # cardNumber:String
          first_name: params[:first_name] || 'First Name',  # firstName:String
          last_name: params[:last_name] || 'Last Name', # lastName:String
          company: params[:company] || 'Company', # company:String
          date_of_birth: {
            date: params[:date_of_birth].blank? ? Date.today.to_s : params[:date_of_birth][:date].to_s || Date.today.to_s, # VanityDate date:String
            locale: params[:date_of_birth].blank? ? 'en_US' : params[:date_of_birth][:locale].to_s || 'en_US' # VanityDate locale:String
          },
          anniversary_date: {
            date: params[:anniversary_date].blank? ? Date.today.to_s : params[:anniversary_date][:date].to_s || Date.today.to_s,  # VanityDate date:String
            locale: params[:anniversary_date].blank? ? 'en_US' : params[:anniversary_date][:locale].to_s || 'en_US' # VanityDate locale:String
          },
          drivers_license: params[:drivers_license] || '1234567890',
          address1: params[:address1] || 'Address 1', # address1:String
          address2: params[:address2] || 'Address 2', # address2:String
          city: params[:city] || 'City', # city:String
          state_province: params[:state_province] || 'State Province', # stateProvince:String
          country: params[:country]|| 'Country', # country:String
          postal_code: params[:postal_code] || '12345', # postalCode:String
          email_address: params[:email_address] || 'test@example.com', # emailAddress:String
          phone_number: params[:phone_number] || '+62891000000', # phoneNumber:String
          other_phone_number: params[:other_phone_number] || '+6222900000', # otherPhoneNumber:String
          profile_exists: params[:profile_exists] # profileExists:Boolean
        }
      })
    end
  end

  ### adjustCredit()
  def self.adjust_credit(params = {})
    @client.call(:adjust_credit) do
      message(adjust_credit_request: {
        'cardNumber' => params[:card_number] || '4242424242424242', # cardNumber:String
        'BPID' => params[:bpid] || 1, # BPID:Int
        'adjustmentType' => params[:adjustment_type] || 1234500000001, # adjustmentType:String
        'BPCredit' => params[:bp_credit] || 1, # BPCredit:Int
        'reason' => params[:reason] || 'test reason' # reason:String
      })
    end
  end

  ### getBonusPlanHistory()
  def self.get_bonus_plan_history(params = {})
    @client.call(:get_bonus_plan_history) do
      message('GetBonusPlanHistoryRequest' => {
        card_number: params[:card_number] || '4242424242424242', # cardNumber:String
        number_of_assignments: params[:number_of_assignments] || 1, # numberOfAssignments:Int
        number_of_days: params[:number_of_days] || 1, # numberDfDays:Int
        start_date: params[:start_date] || Date.today.to_s, # startDate:String
        end_date: params[:end_date] || Date.today.to_s # endDate:String
      })
    end
  end

  ### getBonusPlanStandings()
  def self.get_bonus_plan_standings(params = {})
    @client.call(:get_bonus_plan_standings) do
      message(get_bonus_plan_standings_request: {
        card_number: params[:card_number] || '42424242424242', # cardNumber:String
        available_items_return: params[:available_items_return], #availableItemsReturn:Boolean
        purchased_items_return: params[:purchased_items_return] #purchasedItemsReturn:Boolean
      })
    end
  end

  ### eMailExists()
  def self.email_exists(params = {})
    @client.call(:e_mail_exists) do
      message(e_mail_exists_request: {e_mail_address: params[:e_mail_address] || 'test@example.com'}) # eMailAddress:String
    end
  end

  ### getCardNumberByEmail()
  def self.get_card_number_by_email(params = {})
    @client.call(:get_card_number_by_email) do
      message('GetCardNumberByEmailRequest' => {email_address: params[:email_address] || 'test@example.com'}) # emailAddress:String
    end
  end

  ### getCardNumberByPhone()
  def self.get_card_number_by_phone(params = {})
    @client.call(:get_card_number_by_phone) do
      message('GetCardNumberByPhoneRequest' => {phone_number: params[:phone_number] || '+6222900000'}) # phoneNumber:String
    end
  end

  ### getCardStatus()  
  def self.get_card_status(params = {})
    @client.call(:get_card_status) do
      message(get_card_status_request: {card_number: params[:card_number] || '42424242424242'}) # cardNumber:String 14 digit
    end
  end

  ### getMemberProfile()  
  def self.get_member_profile(params = {})
    @client.call(:get_member_profile) do
      message(get_member_profile_request: {card_number: params[:card_number] || '42424242424242'}) # cardNumber:String 14 digit
    end
  end

  ### phoneNumberExists() 
  def self.phone_number_exists(params = {})
    @client.call(:phone_number_exists) do
      message('PhoneNumberExistsRequest' => {phone_number: params[:card_number] || '+62229000000'}) # phoneNumber:String
    end
  end

  ### updateMemberProfile()
  def self.update_member_profile(params = {})
    @client.call(:update_member_profile) do
      message(update_member_profile_request: {
        profile: {
          member_account_id: params[:member_account_id] || 1, # memberAccountID:int
          card_number: params[:card_number] || '424242424242', # cardNumber:String
          first_name: params[:first_name] || 'First Name',  # firstName:String
          last_name: params[:last_name] || 'Last Name', # lastName:String
          company: params[:company] || 'Company', # company:String
          date_of_birth: {
              date: params[:date_of_birth].blank? ? Date.today.to_s : params[:date_of_birth][:date].to_s || Date.today.to_s,
              locale: params[:date_of_birth].blank? ? 'en_US' : params[:date_of_birth][:locale].to_s || 'en_US'
          },
          anniversary_date: {
              date: params[:anniversary_date].blank? ? Date.today.to_s : params[:anniversary_date][:date].to_s || Date.today.to_s,
              locale: params[:anniversary_date].blank? ? 'en_US' : params[:anniversary_date][:locale].to_s || 'en_US'
          },
          drivers_license: params[:drivers_license] || '1234567890',
          address1: params[:address1] || 'Address 1', # address1:String
          address2: params[:address2] || 'Address 2', # address2:String
          city: params[:city] || 'City', # city:String
          state_province: params[:state_province] || 'State Province', # stateProvince:String
          country: params[:country]|| 'Country', # country:String
          postal_code: params[:postal_code] || '12345', # postalCode:String
          email_address: params[:email_address] || 'test@example.com', # emailAddress:String
          phone_number: params[:phone_number] || '+62891000000', # phoneNumber:String
          other_phone_number: params[:other_phone_number] || '+6222900000' # otherPhoneNumber:String
        }
      })
    end
  end

  ### assignForgottenCard()
  def self.assign_forgotten_card(params = {})
    @client.call(:assign_forgotten_card) do
      message(assign_forgotten_card_request: {
          card_number: params[:card_number] || '4242424242424242', # cardNumber:String
          claim_ID: params[:claim_id] || '12345678910' # claimID:String
      })
    end
  end

  ### getCheckDetail()
  def self.get_check_detail(params = {})
    @client.call(:get_check_detail) do
      message('GetCheckDetailRequest' => {
        claim_ID: params[:claim_id] || 'testexample123123', # claimID:String
        store_ID: params[:store_id] || 1122334455, # store_ID:Int
        date_of_business: params[:date_of_business] || Date.today.to_s # dateOfBusiness:String
      })
    end
  end
end
