module RoutingResourcesMacros
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def resources_should_routes resources, methods = [:index, :new, :show, :edit, :create, :update, :destroy]
      id = '12345'
      describe "routing /#{resources} CRUD" do
        if methods.include? :index
          it "routes to #index" do
            get("/#{resources}").should route_to("#{resources}#index")
          end
        else
          it "no routes to #index" do
            get("/#{resources}").should_not route_to("#{resources}#index")
          end
        end
        if methods.include? :new
          it "routes to #new" do
            get("/#{resources}/new").should route_to("#{resources}#new")
          end
        else
          it "no routes to #new" do
            get("/#{resources}/new").should_not route_to("#{resources}#new")
          end
        end
        if methods.include? :show
          it "routes to #show" do
            get("/#{resources}/#{id}").should route_to("#{resources}#show", :id => id)
          end
        else
          it "no routes to #show" do
            get("/#{resources}/#{id}").should_not route_to("#{resources}#show", :id => id)
          end
        end
        if methods.include? :edit
          it "routes to #edit" do
            get("/#{resources}/#{id}/edit").should route_to("#{resources}#edit", :id => id)
          end
        else
          it "no routes to #edit" do
            get("/#{resources}/#{id}/edit").should_not route_to("#{resources}#edit", :id => id)
          end
        end
        if methods.include? :create
          it "routes to #create" do
            post("/#{resources}").should route_to("#{resources}#create")
          end
        else
          it "no routes to #create" do
            post("/#{resources}").should_not route_to("#{resources}#create")
          end
        end
        if methods.include? :update
          it "routes to #update" do
            put("/#{resources}/#{id}").should route_to("#{resources}#update", :id => id)
          end
        else
          it "no routes to #update" do
            put("/#{resources}/#{id}").should_not route_to("#{resources}#update", :id => id)
          end
        end
        if methods.include? :destroy
          it "routes to #destroy" do
            delete("/#{resources}/#{id}").should route_to("#{resources}#destroy", :id => id)
          end
        else
          it "no routes to #destroy" do
            delete("/#{resources}/#{id}").should_not route_to("#{resources}#destroy", :id => id)
          end
        end
      end
    end

    def resource_should_routes resources, methods = [:new, :show, :edit, :create, :update, :destroy]
      describe "routing /#{resources} CRUD" do
        if methods.include? :new
          it "routes to #new" do
            get("/#{resources}/new").should route_to("#{resources}#new")
          end
        else
          it "no routes to #new" do
            get("/#{resources}/new").should_not route_to("#{resources}#new")
          end
        end
        if methods.include? :show
          it "routes to #show" do
            get("/#{resources}").should route_to("#{resources}#show")
          end
        else
          it "no routes to #show" do
            get("/#{resources}").should_not route_to("#{resources}#show")
          end
        end
        if methods.include? :edit
          it "routes to #edit" do
            get("/#{resources}/edit").should route_to("#{resources}#edit")
          end
        else
          it "no routes to #edit" do
            get("/#{resources}/edit").should_not route_to("#{resources}#edit")
          end
        end
        if methods.include? :create
          it "routes to #create" do
            post("/#{resources}").should route_to("#{resources}#create")
          end
        else
          it "no routes to #create" do
            post("/#{resources}").should_not route_to("#{resources}#create")
          end
        end
        if methods.include? :update
          it "routes to #update" do
            put("/#{resources}").should route_to("#{resources}#update")
          end
        else
          it "no routes to #update" do
            put("/#{resources}").should_not route_to("#{resources}#update")
          end
        end
        if methods.include? :destroy
          it "routes to #destroy" do
            delete("/#{resources}").should route_to("#{resources}#destroy")
          end
        else
          it "no routes to #destroy" do
            delete("/#{resources}").should_not route_to("#{resources}#destroy")
          end
        end
      end
    end

    def nested_resources_should_routes parent, resources, methods = [:index, :new, :show, :edit, :create, :update, :destroy]
      parent_id = '12345'
      id = '23456'
      describe "routing /#{parent}/:#{parent.singularize}_id/#{resources} CRUD" do
        if methods.include? :index
          it "routes to #index" do
            get("/#{parent}/#{parent_id}/#{resources}").should route_to("#{resources}#index", "#{parent.singularize}_id" => parent_id)
          end
        else
          it "no routes to #index" do
            get("/#{parent}/#{parent_id}/#{resources}").should_not route_to("#{resources}#index", "#{parent.singularize}_id" => parent_id)
          end
        end
        if methods.include? :new
          it "routes to #new" do
            get("/#{parent}/#{parent_id}/#{resources}/new").should route_to("#{resources}#new", "#{parent.singularize}_id" => parent_id)
          end
        else
          it "no routes to #new" do
            get("/#{parent}/#{parent_id}/#{resources}/new").should_not route_to("#{resources}#new", "#{parent.singularize}_id" => parent_id)
          end
        end
        if methods.include? :show
          it "routes to #show" do
            get("/#{parent}/#{parent_id}/#{resources}/#{id}").should route_to("#{resources}#show", "#{parent.singularize}_id" => parent_id, :id => id)
          end
        else
          it "no routes to #show" do
            get("/#{parent}/#{parent_id}/#{resources}/#{id}").should_not route_to("#{resources}#show", "#{parent.singularize}_id" => parent_id, :id => id)
          end
        end
        if methods.include? :edit
          it "routes to #edit" do
            get("/#{parent}/#{parent_id}/#{resources}/#{id}/edit").should route_to("#{resources}#edit", "#{parent.singularize}_id" => parent_id, :id => id)
          end
        else
          it "no routes to #edit" do
            get("/#{parent}/#{parent_id}/#{resources}/#{id}/edit").should_not route_to("#{resources}#edit", "#{parent.singularize}_id" => parent_id, :id => id)
          end
        end
        if methods.include? :create
          it "routes to #create" do
            post("/#{parent}/#{parent_id}/#{resources}").should route_to("#{resources}#create", "#{parent.singularize}_id" => parent_id)
          end
        else
          it "no routes to #create" do
            post("/#{parent}/#{parent_id}/#{resources}").should_not route_to("#{resources}#create", "#{parent.singularize}_id" => parent_id)
          end
        end
        if methods.include? :update
          it "routes to #update" do
            put("/#{parent}/#{parent_id}/#{resources}/#{id}").should route_to("#{resources}#update", "#{parent.singularize}_id" => parent_id, :id => id)
          end
        else
          it "no routes to #update" do
            put("/#{parent}/#{parent_id}/#{resources}/#{id}").should_not route_to("#{resources}#update", "#{parent.singularize}_id" => parent_id, :id => id)
          end
        end
        if methods.include? :destroy
          it "routes to #destroy" do
            delete("/#{parent}/#{parent_id}/#{resources}/#{id}").should route_to("#{resources}#destroy", "#{parent.singularize}_id" => parent_id, :id => id)
          end
        else
          it "no routes to #destroy" do
            delete("/#{parent}/#{parent_id}/#{resources}/#{id}").should_not route_to("#{resources}#destroy", "#{parent.singularize}_id" => parent_id, :id => id)
          end
        end
      end
    end

    def nested_resource_should_routes parent, resources, methods = [:new, :show, :edit, :create, :update, :destroy]
      parent_id = '12345'
      describe "routing /#{parent}/:#{parent.singularize}_id/#{resources} CRUD" do
        if methods.include? :new
          it "routes to #new" do
            get("/#{parent}/#{parent_id}/#{resources}/new").should route_to("#{resources}#new", "#{parent.singularize}_id" => parent_id)
          end
        else
          it "no routes to #new" do
            get("/#{parent}/#{parent_id}/#{resources}/new").should_not route_to("#{resources}#new", "#{parent.singularize}_id" => parent_id)
          end
        end
        if methods.include? :show
          it "routes to #show" do
            get("/#{parent}/#{parent_id}/#{resources}").should route_to("#{resources}#show", "#{parent.singularize}_id" => parent_id)
          end
        else
          it "no routes to #show" do
            get("/#{parent}/#{parent_id}/#{resources}").should_not route_to("#{resources}#show", "#{parent.singularize}_id" => parent_id)
          end
        end
        if methods.include? :edit
          it "routes to #edit" do
            get("/#{parent}/#{parent_id}/#{resources}/edit").should route_to("#{resources}#edit", "#{parent.singularize}_id" => parent_id)
          end
        else
          it "no routes to #edit" do
            get("/#{parent}/#{parent_id}/#{resources}/edit").should_not route_to("#{resources}#edit", "#{parent.singularize}_id" => parent_id)
          end
        end
        if methods.include? :create
          it "routes to #create" do
            post("/#{parent}/#{parent_id}/#{resources}").should route_to("#{resources}#create", "#{parent.singularize}_id" => parent_id)
          end
        else
          it "no routes to #create" do
            post("/#{parent}/#{parent_id}/#{resources}").should_not route_to("#{resources}#create", "#{parent.singularize}_id" => parent_id)
          end
        end
        if methods.include? :update
          it "routes to #update" do
            put("/#{parent}/#{parent_id}/#{resources}").should route_to("#{resources}#update", "#{parent.singularize}_id" => parent_id)
          end
        else
          it "no routes to #update" do
            put("/#{parent}/#{parent_id}/#{resources}").should_not route_to("#{resources}#update", "#{parent.singularize}_id" => parent_id)
          end
        end
        if methods.include? :destroy
          it "routes to #destroy" do
            delete("/#{parent}/#{parent_id}/#{resources}").should route_to("#{resources}#destroy", "#{parent.singularize}_id" => parent_id)
          end
        else
          it "no routes to #destroy" do
            delete("/#{parent}/#{parent_id}/#{resources}").should_not route_to("#{resources}#destroy", "#{parent.singularize}_id" => parent_id)
          end
        end
      end
    end
  end
end
