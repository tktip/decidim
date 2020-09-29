# frozen_string_literal: true

module Decidim
  module Accountability
    # This mailer sends a notification email containing the result of importing a
    # CSV of results.
    class ImportMailer < Decidim::ApplicationMailer
      # Public: Sends a notification email with the result of a CSV import
      # of results.
      #
      # user   - The user to be notified.
      # errors - The list of errors generated by the import
      #
      # Returns nothing.
      def import(user, errors)
        @user = user
        @organization = user.organization
        @errors = errors

        with_user(user) do
          mail(to: "#{user.name} <#{user.email}>", subject: I18n.t("decidim.accountability.import_mailer.import.subject"))
        end
      end
    end
  end
end