class PackageController < ApplicationController
    layout 'standard'

    def list
        @packages = Package.all
    end
    
    def show
        @package = Package.find(params[:id])
    end
    
    def new
        @package = Package.new
@couriers = Courier.all
    end
    
    def create
        @package = Package.new(package_params)
         
        if @package.save
           redirect_to :action => 'list'
        else
           @couriers = Courier.all
           render :action => 'new'
        end
        
     end
     
     def package_params
        params.require(:packages).permit(:tracking_number, :delivery_status, :courier_id)
     end
    
    def edit
        @package = Package.find(params[:id])
@couriers = Courier.all
    end
    
    def update
        @package = Package.find(params[:id])
         
        if @package.update_attributes(package_param)
           redirect_to :action => 'show', :id => @package
        else
           @couriers = Courier.all
           render :action => 'edit'
        end
        
     end
     
     def package_param
        params.require(:package).permit(:tracking_number, :delivery_status, :courier_id)
     end
    
    def delete
        Package.find(params[:id]).destroy
redirect_to :action => 'list'
    end
    
    def show_couriers
        @courier = Courier.find(params[:id])
     end 
end
