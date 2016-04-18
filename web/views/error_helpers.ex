defmodule Identificator.ErrorHelpers do
  @moduledoc """
  Conveniences for translating and building error messages.
  """

  use Phoenix.HTML

  @doc """
  Generates tag for inlined form input errors.
  """
  def error_tag(form, field) do
    error = form.errors[field]
    if error do
      content_tag :span, translate_error(error), class: "help-block"
    end
  end

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, opts}) do
    # Because error messages were defined within Ecto, we must call the Gettext module passing our
    # Gettext backend. We also use the "errors" domain as translations are placed in the errors.po
    # file. On your own code and templates, his could be written simply as:
    #
    #     dngettext "errors", "1 file", "%{count} files", count
    #
    count = opts[:count]
    if count do
      Gettext.dngettext(Identificator.Gettext, "errors", msg, msg, count || 0, opts)
    else
      Gettext.dgettext(Identificator.Gettext, "errors", msg, opts)
    end
  end

  def translate_error(msg) do
    Gettext.dgettext(Identificator.Gettext, "errors", msg)
  end
end
