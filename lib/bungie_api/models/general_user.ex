defmodule User.GeneralUser do
  @moduledoc """
  http://destinydevs.github.io/BungieNetPlatform/docs/schemas/User-GeneralUser
  """

  @derive[Poison.Decoder]
  defstruct [
    :membershipId,
    :uniqueName,
    :normalizedName,
    :displayName,
    :profilePicture,
    :profileTheme,
    :userTitle,
    :successMessageFlags,
    :isDeleted,
    :about,
    :firstAccess,
    :lastUpdate,
    :legacyPortalUID,
    :context,
    :psnDisplayName,
    :xboxDisplayName,
    :fbDisplayName,
    :showActivity,
    :locale,
    :localeInheritDefault,
    :lastBanReportId,
    :showGroupMessaging,
    :profilePicturePath,
    :profilePictureWidePath,
    :profileThemeName,
    :userTitleDisplay,
    :statusText,
    :statusDate,
    :profileBanExpire,
    :blizzardDisplayName,
  ]
end

defimpl Poison.Decoder, for: User.GeneralUser do

  def decode(%{firstAccess: first_access, lastUpdate: last_update, profileBanExpire: profile_ban_expire} = user, _options) do
    profile_ban_expire = if profile_ban_expire != nil do
      {:ok, profile_ban_expire, _} = DateTime.from_iso8601(profile_ban_expire)
      profile_ban_expire
    end
    with {:ok, fa, _} <- DateTime.from_iso8601(first_access),
         {:ok, lu, _} <- DateTime.from_iso8601(last_update)
    do
      %{user | firstAccess: fa, lastUpdate: lu, profileBanExpire: profile_ban_expire}
    else
      _ -> user
    end
  end

end
