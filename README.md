identificator
=============
[![Build Status](https://travis-ci.org/gagalago/identificator.svg?branch=master)](https://travis-ci.org/gagalago/identificator)
[![Deps Status](https://beta.hexfaktor.org/badge/all/github/gagalago/identificator.svg)](https://beta.hexfaktor.org/github/gagalago/identificator)

To generate rsa keys
--------------------

```elixir
jwk_rs512 = JOSE.JWK.generate_key({:rsa, 4096})
```
