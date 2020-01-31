module Control.Joint.Effects.Transactional where

import "stm" Control.Monad.STM (STM)
import "joint" Control.Joint.Abilities (Liftable)

type Transactional = Liftable STM
