use Mix.Config

# For development, we disable any cache and enable debugging and code reloading.
#
# The watchers configuration can be used to run external watchers to your application. For example,
# we use it with brunch.io to recompile .js and .css sources.
config :identificator, Identificator.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

# Watch static and templates for browser reloading.
config :identificator, Identificator.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Do not configure such in production as keeping and
# calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :identificator, ecto_repos: [Identificator.Repo]
config :identificator, Identificator.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "identificator_dev",
  hostname: "localhost",
  pool_size: 10

config :guardian, Guardian,
  allowed_algos: ["RS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "identificator",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: fn ->
    "{\"d\":\"Dc31SPgIPK4YxYQdpLjI1i-1L55ij6fnk-eo4JTXapmrIrUZrMi6GtmIVsaMkewiYLrFLy3rPuAOfPLX5Rzdsnz04M9n8IXhIoj2sAVB7Xp0Ei4kLdI78ZIakC5yfzfq6fzN92dx1FxSaRnAbmNHq5L8m8VxY-AmBfeopha4x4tDd9rVShFOLkVJrlPfEvYuPV6-W2FKIN2EZuXUE-fPF3N4WLbH41X8R6VGDuN1jcBk9shNglBuJXIxqkT6QRhTpcYQzjRZmptxzqzGHQtzmQWGXzgVgjvVSbiAm6vlim8bKnwg_WjZvAVbTGkutOWgKaohLXKiVGHhZSi94o0sEpwFl9Nfnew4RXE-eULXNFik3CoaQ6W7A8u3hCdPzA0w5_eJXwVCBOQTTi52DEGxOsfuxHceQ_vv-5_fnblSfIFUDU7r0SZAdRGvPWmv-5Gi8DinLuA3u8c8O3KgYWnORNBGh74rQacCWNpp5K2kSSISsCnUB-nUvk3lpzxM2jdDSoBR1kUsvyYUsjNuG5f_wHKRfgkC8RDQQk4d1o2My8qVFag6-pkBx2n_nKBo2WA2SxIadvbBGLzXmrew7_10qyqeuyL-OrUh-oyaOADCc6SdgVMdYOn9XsBUsScyD30Z36UEly_DSyuc4HlYyu7rmZhzBndSNMzxOyc8gNRJAAE\",\"dp\":\"iBAJaswiomDRaD2M3ot-eT5flwumIc1Qry4nXuiJ3YJUhRyMzjb40xsh-K-UbiZwIS8uVIfwLfqjdgpyU38xUMlpc-Gj-1GtGVopGJN8Sho13DBq5cOPh7tc3AVsEyapaaiH1LrmMJVhUxcRchvIttD0nChwlw9p9tLwn43619FJpYfrav7q6viRnIu5tXkq5J_OkI6X-9Ur-8X90AcJK6vXf6U06zum-lI9QT5pKZ1k5mW9zs1IjsCkwKA7zjqBNNeMnXzZx1oVLZcJNYzpLmLwrZ05A_35nw7TVQC0sWjMF4Vgjw5lFusWsOw6d6swyBNVjNxrXNJ01Zn2CXDVoQ\",\"dq\":\"ahjRz9TCkx-nhA6az4q1zfKl2Q8IanXq6obk0L3P_Q_g30ZC0XN7IZwMzqKOjn7RmT0r1cDxBijaYo0RgCVYKlqgm_JCgwJstiSClylOtXubpwfp1wY098snlfFWuBIP1vv8xoSIHf0M8WEyHTen7eZNBd1jA9Pg8QY2M7-F3MkXYIrEufGtlNbgefcR4ZQXQcvLjr0JoLKBC4RPOHO9zAtoykQd_Kzad17Q8d-cuYBIVcQ3Z5q561azq9ZMH9X_bTL65rkL3J_scJT5Jz1alkypeCw_CpWV9V76Ykfdja4L-kMjiAG8ZCybv9NZt-esiMLpChJim1To-0VNkPWYAQ\",\"e\":\"AQAB\",\"kty\":\"RSA\",\"n\":\"yzawlc_Ed_gIfPImsI53FeHVLfolJhfgelIoftVyvgzAFEEdUcqS848E2RCF5HB93VWsY4rVuVjcouxEikd24KQwoiw0cB503k8xgi6S5y5SJk8HW66tpUOhXiG8Pj3D2OHdvZvJegdKJQpwQJ2sq71O0lieyDJAS09GBfGsoxQvGeSx2UcWSVehcba1LhLuCJEetptXweCPx4vJW4l82jIhXKS4lsN8THPK4JN2EHFSEN0OLlfj0RkFFjuaOaaRt2pplvPMawO0OAplTvuqsaGpVFMTOVlyLH6ji9_eUpxEoliF9CU2VQ0SRbhqnR2AiMHUu-gQ9s_M4f3f_PSmhVzEck7H48MudhYpa3kRzWpoAuiHGKdXd3Ge0vvai4Zz-dTgUKGDqHEtEwoI0lgIgeFMkxRSCcmx6sCrBc_u-w-xgEZ1LVJ5NSgmqVhUNABrfjA-NT4WKITwaRYaYcFaGbG5H8SfDGh7lFBhQtbmqmX2ADoz0Y2M7KORwO_4AVDhsJHuG95LC5-hYmPK7VBpS3Uu6bjnjUynHNb9MQU3Egu3_meCjBSYVZnc6NLgsVQQdn2Ky5jc-dtF6SGIlfkIkyiPJYv0FU63vhzvjG7l-3nz9qoPQKa4VckT6mL2WbsHJIx_r1rHz0vX3vmkQXoif8_LmLodDBsk4ynEYeHufyE\",\"p\":\"_WgudtdV_KoAKvGrRqorb-cnl_ZCk6n4KUFesR3Ta0znfIiyWE1mJhssNXfOOPR8V3DEKTjb-xpEFZsoF5UBVMfnemUxu0rbA5w74Ozoz8Na9lVjJv10tSsm_y4SwlXOMprABonLkpSzSd2uMaOVmacjk1klYfGASCU-daBozVwTZq74fdhsYdSaAVzldlWSO7fiYPvzpnBH8Sxhu4Tx3qxeKfPpvd_YlXdqgnA2as0SS4xbq0ER-g7LMzOL6K25EGGrkuotS65KghfWthvTLk5nNQqTPYRwRnvD4M4ZOwS0C0W7QSAexKx1VM-2HUWpUf9T9lLzgNih6a-jQQIrIQ\",\"q\":\"zUsF6l9X9naQg0Iv59rp-uTdNuUmHsuKZWLAfggy38FXUoPc7WDqxPahfv1sj3eWm3rznIIdWYULpoFmD74ngzfg2VaXau1McvS-YFKFSgsqJmSXs9AFEGcHu56QMWgyvUJBHHG6JmexI8wV7_Wjf37OIar15WqnUU5QOT6cL_EoHeL8VQD6n1UpcOcST6Y2rQxFEmbD_ClP0OBpbdg65IrOoGypAoQFp8JEHucP5V9Dgt5nk-bq_QbXIPQ5TuEkMr_kI0gkFLVJXWLUmg6tS1nGn6T9806I8t7oaZdsBRs80QamVjwbUKecztlbxHN2zgkNqGE0e5cAl0YxW5XUAQ\",\"qi\":\"IJt0SnYxYnIqBuMfBkJhInmltS4x2FXgZdRm9NAysDKMZ24OylfY2qUNASvtzNG9khWkChiI4fflmeyaFme7ecb4PkYQko_KBP0HChp3zcg7WtdydFlgaATCTeeNzfiYah76cPI7v_N_zrDC_BQwriiz_wms3rLjnUBFrzEXs_GPiVpai5jQ0cDwSdzISgne_Hgvvkr9sgwgeWN4nV7k_z68hjC9WgssIsW1oqqonYYIEBPu8Grd320U4RkDpGq-QO_ySONS0TXdfL1BJ3k2ZlTMTftI5phlQiJyqrZchTuWB46nVaa6_oWk4d4nuM7bhl86kJsQQButubrpRB_fng\"}"
    |> JOSE.JWK.from_binary
  end,
  serializer: Identificator.GuardianSerializer
