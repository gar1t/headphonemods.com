-module(index).

data(_) ->
    #{site => "site.config",
      mods => {markdown, "mods/*.md"}}.

site(Data) ->
    #{"site/index.html"            => {template, "templates/index.html"},
      "site/assets"                => {dir, "assets"},
      "site/{{mod|basename}}.html" => {template_map, "templates/mod.html",
                                       {mod, mods(Data)}}}.

mods(Data) -> plist:value(mods, Data).

recent_mods(Mods) ->
    Mods.
