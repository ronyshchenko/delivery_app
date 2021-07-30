class CourierController < ApplicationController
    def list
        @couriers = Courier.all
    end
    
    def show
        @courier = Courier.find(params[:id])
        @packages = Package.all
    end

    def show_package
      @package = Package.find(params[:id])
    end
    
    def new
        @courier = Courier.new
         @couriers = Courier.all
    end



    def new_package
      @package = Package.new
@subjects = Subject.all
  end
  
  def create_package
      @package = Package.new(package_params)
       
      if @package.save
         redirect_to :action => 'list'
      else
         @subjects = Subject.all
         render :action => 'new'
      end
      
   end
   
   def package_params
      params.require(:packages).permit(:tracking_number, :delivery_status, :courier_id)
   end
    
    




    def create
        @courier = Courier.new(courier_params)
         
        if @courier.save
           redirect_to :action => 'list'
        else
           @couriers = Courier.all
           render :action => 'new'
        end
        
     end
     
     def courier_params
        params.require(:couriers).permit(:name, :email)
     end
    
    def edit
        @courier = Courier.find(params[:id])
        @couriers = Courier.all
    end
    
    def update
        @courier = Courier.find(params[:id])
         
        if @courier.update_attributes(courier_param)
           redirect_to :action => 'show', :id => @courier
        else
           @couriers = Courier.all
           render :action => 'edit'
        end
        
     end
     
     def courier_param
        params.require(:courier).permit(:name, :email)
     end
    
    def delete
        Courier.find(params[:id]).destroy
redirect_to :action => 'list'
    end
    
    def show_couriers
        @courier = Courier.find(params[:id])
     end  
end

