module Control.Joint.Effects.Transactional where

import "stm" Control.Monad.STM (STM, atomically)
import "joint" Control.Joint.Abilities (Composition (Primary, run), Liftable)

instance Composition STM where
	type Primary STM a = IO a
	run = atomically

type Transactional = Liftable STM
