class ChargesController < ApplicationController
    
    after_action :make_premium, only: :create
    
    def create
        # Creates a Stripe Customer object, for associating with the charge
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )
        
        # Where customer is charged (The Magic Happens)
        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: 15_00,
            description: "Premium Membership - #{current_user.email}",
            currency: 'usd'
        )
        
        flash[:notice] = "Thanks for the purchase, #{current_user.email}!"
        redirect_to root_path
        
    #Rescue block to display friendly messaged errors
    rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path
    end
    
    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "Premium Membership - #{current_user.email}",
            amount: 15_00
        }
    end
    
    def downgrade
        current_user.member!(:role, 'member')
        
            flash[:notice] = "You have successfully downgraded your account!"
            redirect_to root_path

    end
    
    
private
    def make_premium
        current_user.update_attribute(:role, 'premium')
        current_user.save!
    end
    
    
     def publicize
        current_user.wikis.each do |wiki|
          wiki.update_attribute(:private, false)
      end
 end
        
end