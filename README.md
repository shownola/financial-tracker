# README

* Rails 6

Requirements:
* Authentication system, users can sign-up, edit their profile, login/logout
* Users can track stock, up to 10 per user. Their profile page will display all of the stocks they are tracking with their current price.
* Users can search for stocks, add and remove stocks from their portfolio
* Create a self referential association for users friendships
* Users can look for friends, or other users of the app, by name or email and
* Users can view the portfolio of stocks their friends are tracking for ideas.
* The app must be mobile friendly.

Restrictions or constraints
* Requires fast development
* Styling, while not of utmost importance, needs to be nice and presentable
* No test framework require since it's a prototype and the aim is to get the product up and running to display at the investor's meeting
* Core functionality, time and presentation are key factors.

Task: Design and add Stock model
* Attributes name, ticker_symbol and price
* Automate looking up stock (currently only possible through the console)
* Automate API key insertion (instead of having to key it in every time we look up a stock)
* Secure api credentials

Task: Lookup stock from browser
* Create form to look up ticker symbol (portfolio view)
* Create route to forward symbol to a controller (portfolio)
* Create controller with action that uses the Stock.new_lookup method (stocks_controller with seach_stocks action)
* Return info for display on the browser to the user (utilize porfolio view to render price information)

* Create many-to-many associations between users and stock through user_stocks
user_stocks_controller, user_stock.rb model, user_stocks table
create routes: resources :user_stocks
 $ rails g resource UserStock user:references stock:references

 $rails routes --expanded |grep user_stocks

* ...

* Create a self referential association for users:  rails g model Friendship user:references  
def change
  create_table :friendships do |t|
    t.references :user, null: false, foreign_key: true
    t.references :friend, references: :users, foreign_key: { to_table: :users }

    t.timestamps
  end

EDITOR="atom --wait" rails credentials:edit

lect 226
