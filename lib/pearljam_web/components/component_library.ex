defmodule PearljamWeb.ComponentLibrary do
  defmacro __using__(_) do
    quote do
      import PearljamWeb.ComponentLibrary
      # Import additional component modules below

    end
  end
  @moduledoc """
  This module is added and used in PearljamWeb. The idea is
  different component modules can be added and imported in the macro section above.
  """
  use Phoenix.Component

end
