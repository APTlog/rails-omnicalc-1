Rails.application.routes.draw do
  get("/", { :controller => "start", :action => "firstpage"} )
  get("/square/results", { :controller => "start", :action => "squareresults"} )
  get("/square/new", { :controller => "start", :action => "squarenew"} )
  get("/square_root/new", { :controller => "start", :action => "squareroot"} )
  get("/square_root/results", { :controller => "start", :action => "sqrtresult"} )
  get("/payment/new", { :controller => "start", :action => "newpayment"} )
  get("/payment/results", { :controller => "start", :action => "paymentresults"} )
  get("/random/new", { :controller => "start", :action => "random"} ) 
  get("/random/results", { :controller => "start", :action => "randomresult"} ) 
end
