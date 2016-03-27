identificator
=============
[![Build Status](https://travis-ci.org/gagalago/identificator.svg?branch=master)](https://travis-ci.org/gagalago/identificator)

To generate rsa keys
--------------------

```elixir
jwk_rs512 = JOSE.JWK.generate_key({:rsa, 4096})
JOSE.JWK.to_public(jwk_rs512)
```
