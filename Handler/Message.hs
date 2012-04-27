module Handler.Message where

import Import

colors = [minBound..maxBound]
sizes = [minBound..maxBound]

messageForm :: Html -> MForm yesodTutorial yesodTutorial (FormResult MessageInfo, widget )
messageForm = renderDivs $
    MessageInfo
        <$> areq textField "message" Nothing
        <*> areq (selectFieldList colors) "coler" Nothing
        <*> areq (selectFieldList sizes) "size" Nothing

data MessageInfo = MessageInfo 
    {
    imessage :: Text,
    icoler :: Color,
    isize :: Size
    }
    deriving Show   

getMessageR :: Handler RepHtml
getMessageR = do
  ((_, widget), enctype) <- runFormPost messageForm
  defaultLayout $ do
    h2id <- lift newIdent
    $(widgetFile "message") 

postMessageR :: Handler RepHtml
postMessageR = do
    ((res, widget), enctype) <- runFormPost messageForm
    defaultLayout $ do
      h2id <- lift newIdent
      $(widgetFile "message")


