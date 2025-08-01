defmodule Dialyxir.Mixfile do
  use Mix.Project

  @source_url "https://github.com/jeremyjh/dialyxir"
  @version "1.4.5"

  def project do
    [
      app: :dialyxir,
      version: @version,
      elixir: ">= 1.6.0",
      elixirc_paths: elixirc_paths(Mix.env()),
      description: description(),
      package: package(),
      deps: deps(),
      aliases: [test: "test --no-start"],
      dialyzer: [
        plt_apps: [:dialyzer, :elixir, :kernel, :mix, :stdlib, :erlex, :logger],
        ignore_warnings: ".dialyzer_ignore.exs",
        flags: [:unmatched_returns, :error_handling, :underspecs]
      ],
      # Docs
      name: "Dialyxir",
      homepage_url: @source_url,
      # The main page in the docs
      docs: [
        main: "readme",
        source_url: @source_url,
        source_ref: @version,
        groups_for_extras: ["CI Configs": ~r{docs/.?}],
        extras: [
          "CHANGELOG.md",
          "README.md",
          "docs/circleci.md",
          "docs/github_actions.md",
          "docs/gitlab_ci.md"
        ]
      ]
    ]
  end

  def application do
    [
      mod: {Dialyxir, []},
      extra_applications: [:dialyzer, :crypto, :mix, :erts, :syntax_tools, :logger]
    ]
  end

  defp description do
    """
    Mix tasks to simplify use of Dialyzer in Elixir projects.
    """
  end

  defp elixirc_paths(:examples), do: ["lib", "test/examples"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:erlex, ">= 0.2.7"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      files: [
        "lib",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["Jeremy Huffman"],
      licenses: ["Apache-2.0"],
      links: %{
        "Changelog" => "https://hexdocs.pm/dialyxir/changelog.html",
        "GitHub" => @source_url
      }
    ]
  end
end
