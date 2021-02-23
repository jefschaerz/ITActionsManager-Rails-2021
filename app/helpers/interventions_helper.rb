module InterventionsHelper
    def isUserConnectedIntervention?(intervention)
      user_signed_in? && current_user.id === intervention.user_id
    end
end
