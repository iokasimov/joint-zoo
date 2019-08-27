module Control.Joint.Zoo.State where

import "joint" Control.Joint.Core (type (:.), type (:=))

newtype State s a = State ((->) s :. (,) s := a)

instance Functor (State s) where
	fmap f (State x) = State $ \old -> f <$> x old

instance Applicative (State s) where
	pure x = State $ \s -> (s, x)
	State f <*> State x = State $ \old ->
		let latest = fst . x $ old in
			(latest, snd (f old) . snd . x $ old)
