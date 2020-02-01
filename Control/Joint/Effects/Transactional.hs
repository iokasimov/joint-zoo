module Control.Joint.Effects.Transactional where

import "stm" Control.Monad.STM (STM, atomically)
import "joint" Control.Joint.Abilities (Composition (Primary, run), Adaptable (adapt), Liftable)

instance Composition STM where
	type Primary STM a = IO a
	run = atomically

instance Adaptable STM IO where
	adapt = atomically

type Transactional = Liftable STM
