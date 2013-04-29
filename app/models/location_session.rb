class LocationSession < Authlogic::Session::Base
  authenticate_with Location
end