module InterventionsHelper
    include Pagy::Frontend

    def isUserConnectedIntervention?(intervention)
      user_signed_in? && current_user.id === intervention.user_id
    end
end
