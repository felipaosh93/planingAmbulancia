(define (problem problemahospital) (:domain Ambulancia)
(:objects 

    ambulancia1 - ambulancia
    L1 L2 L3 L4 - localizacion
    enfermo1 enfermo2 - enfermo

)

(:init

    (afueraambulancia enfermo1)
    (elocalizacion enfermo1 L4)
    (afueraambulancia enfermo2)
    (elocalizacion enfermo2 L3)

    (ambulanciaestado ambulancia1)
    (alocalizacion ambulancia1 L1)

    (enlace L1 L2)
    (enlace L2 L1)
    (enlace L2 L4)
    (enlace L4 L2)
    (enlace L4 L3)
    (enlace L3 L4)
    
)

(:goal (and
    ;todo: put the goal condition here
    (afueraambulancia enfermo1)
    (elocalizacion enfermo1 L1)
    (afueraambulancia enfermo2)
    (elocalizacion enfermo2 L1)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
