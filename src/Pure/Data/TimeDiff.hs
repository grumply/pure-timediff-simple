{-# LANGUAGE DeriveGeneric, DeriveAnyClass, RecordWildCards #-}
module Pure.Data.TimeDiff where

import Pure (Millis(..),Micros(..))
import Pure.Data.JSON
import Pure.Data.Default

import GHC.Generics

data TimeDiff = TimeDiff
  { seconds :: Double
  , minutes :: Double
  , hours   :: Double
  , days    :: Double
  , weeks   :: Double
  , months  :: Double
  , years   :: Double
  } deriving (Generic,Default,ToJSON,FromJSON)

class TimeDiffable a where
    mkTimeDiff :: a -> a -> TimeDiff

instance TimeDiffable Micros where
    mkTimeDiff (Micros now) (Micros ago) = TimeDiff {..}
      where
        d = now - ago
        second  = 1000  * 1000
        minute  = 60    * second
        hour    = 60    * minute
        day     = 24    * hour
        week    = 7     * day
        month   = 30.42 * day
        year    = 365   * day
        seconds = d / second
        minutes = d / minute
        hours   = d / hour
        days    = d / day
        weeks   = d / week
        months  = d / month
        years   = d / year

instance TimeDiffable Millis where
    mkTimeDiff (Millis now) (Millis ago) = TimeDiff {..}
      where
        d = now - ago
        second  = 1000
        minute  = 60    * second
        hour    = 60    * minute
        day     = 24    * hour
        week    = 7     * day
        month   = 30.42 * day
        year    = 365   * day
        seconds = d / second
        minutes = d / minute
        hours   = d / hour
        days    = d / day
        weeks   = d / week
        months  = d / month
        years   = d / year

