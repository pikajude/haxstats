module Stats.TeamSearch where

import Control.Applicative
import Control.Concurrent.ParallelIO
import Data.Maybe
import qualified Data.Set as S
import Data.Text (Text)
import qualified Data.Text as T
import Network.HTTP
import Network.URI
import Stats.Cookie
import Text.HTML.DOM
import Text.XML.Cursor

getTeamLinks :: IO [Text]
getTeamLinks = do
    rsp <- simpleHTTP . cookRequest $ mkRequest GET (fromJust $ parseURI "http://www.sphaxball.com/")
    case rsp of Left err -> error $ show err
                Right resp -> do
                    let body = rspBody resp
                        doc  = fromDocument $ parseLBS body
                    return $ doc $// attributeIs "id" "teamlogobar"
                                 >=> descendant
                                 >=> attribute "href"

getGames :: IO (S.Set Text)
getGames = do
    teams <- getTeamLinks
    texts <- parallel $ map getGamesFor teams
    return . S.fromList $ concat texts

getGamesFor :: Text -> IO [Text]
getGamesFor f = do
    rsp <- simpleHTTP . cookRequest $ mkRequest GET (fromJust $ parseURI $ T.unpack f)
    case rsp of Left err -> error $ show err
                Right resp -> do
                    let body = rspBody resp
                        doc = fromDocument $ parseLBS body
                    return $ doc $// attributeIs "id" "team-schedule"
                                 >=> descendant
                                 >=> element "td"
                                 >=> hasAttribute "style"
                                 >=> descendant
                                 >=> attribute "href"
