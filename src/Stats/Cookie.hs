module Stats.Cookie where

import Network.HTTP

cookRequest :: Request a -> Request a
cookRequest req = req { rqHeaders = mkHeader HdrCookie "SMFCookie765=a%3A4%3A%7B\
                       \i%3A0%3Bs%3A4%3A%221987%22%3Bi%3A1%3Bs%3A40%3A%224c20c6d\
                       \16e7b54546a0d0c203252e136c99d37d2%22%3Bi%3A2%3Bi%3A15649\
                       \50368%3Bi%3A3%3Bi%3A0%3B%7D; SMFCookie765=a%3A4%3A%7Bi%3\
                       \A0%3Bs%3A4%3A%221987%22%3Bi%3A1%3Bs%3A40%3A%224c20c6d16e\
                       \7b54546a0d0c203252e136c99d37d2%22%3Bi%3A2%3Bi%3A15649503\
                       \68%3Bi%3A3%3Bi%3A0%3B%7D; SMFCookie765=a%3A4%3A%7Bi%3A0%\
                       \3Bs%3A4%3A%221987%22%3Bi%3A1%3Bs%3A40%3A%224c20c6d16e7b5\
                       \4546a0d0c203252e136c99d37d2%22%3Bi%3A2%3Bi%3A1564950368%\
                       \3Bi%3A3%3Bi%3A0%3B%7D; sphbid=d68a18275455ae3eaa2c291eeb\
                       \b46e6d; PHPSESSID=ogdspvkhjv6abf486096r6r7l2; __utma=218\
                       \674523.1721984925.1377147405.1377186056.1377188779.3; __\
                       \utmb=218674523.31.10.1377188779; __utmc=218674523; __utm\
                       \z=218674523.1377147405.1.1.utmcsr=(direct)|utmccn=(direc\
                       \t)|utmcmd=(none)":rqHeaders req }
