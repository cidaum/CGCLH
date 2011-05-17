﻿module Analise.Lexica.Automato where

data EstadoAutomato = Estado [(Char, EstadoAutomato)] |
                        EstadoFinal |
                        EstadoErro 
                        deriving (Show)
                        
proximoEstado :: EstadoAutomato -> Char -> EstadoAutomato
proximoEstado EstadoFinal _ = EstadoErro
proximoEstado EstadoErro _ = EstadoErro
proximoEstado (Estado estados) ch = buscaEstado estados ch

buscaEstado :: [(Char, EstadoAutomato)] -> Char -> EstadoAutomato
buscaEstado [] _ = EstadoErro
buscaEstado estados c = let ch = fst (head estados) 
                            st = snd (head estados)
                            in
                        if ch == c then st else  buscaEstado (tail estados) c

(>>>) :: Char -> EstadoAutomato -> (Char, EstadoAutomato)
(>>>) ch estado = (ch, estado)
    