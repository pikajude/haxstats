module Stats.Cookie where

import Network.HTTP

cookRequest :: Request a -> Request a
cookRequest req = req
