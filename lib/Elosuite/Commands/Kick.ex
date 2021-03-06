defmodule TBC.Commands.Kick do
  alias Coxir.Struct.Member
  import TBC.Helpers

  def exec(member, by, guild, reason) do
    member = Member.get(guild, member)
    by = Member.get(guild, by)

    memberRoles = getHighestRole(member[:roles])
    byRoles = getHighestRole(by[:roles])
    if memberRoles < byRoles do
      Member.kick(member, reason)
    else
      :forbidden
    end
  end
end
