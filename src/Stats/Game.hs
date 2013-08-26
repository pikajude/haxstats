module Stats.Game where

import Data.Maybe
import qualified Data.Text as T
import Network.HTTP
import Network.URI
import Stats.Cookie
import Text.HTML.DOM
import Text.XML hiding (parseLBS)
import Text.XML.Cursor

getStats f = do
    rsp <- simpleHTTP . cookRequest $ mkRequest GET (fromJust $ parseURI $ T.unpack f)
    case rsp of
        Left err -> error $ show err
        Right resp -> do
            let body = rspBody resp
                doc = fromDocument $ parseLBS body
                tds = map node $ doc $// attributeIs "id" "game-goals"
                                     >=> descendant
                                     >=> element "td"
            return doc

extractScorers ((NodeElement el):elems) = elementNodes el:extractScorers elems
extractScorers [] = []
