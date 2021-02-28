(define (problem problemahospital) (:domain Ambulancia)
(:objects 

    ambulancia1 ambulancia2 - ambulancia
    L1 L2 L3 L4 L5 L6 - localizacion
    enfermo1 enfermo2 enfermo3 - enfermo

)

(:init

    (afueraambulancia enfermo1)
    (elocalizacion enfermo1 L6)
    (afueraambulancia enfermo2)
    (elocalizacion enfermo2 L3)
    (afueraambulancia enfermo3)
    (elocalizacion enfermo3 L5)

    (ambulanciaestado ambulancia1)
    (alocalizacion ambulancia1 L1)
    (ambulanciaestado ambulancia2)
    (alocalizacion ambulancia2 L1)

    (enlace L1 L2)
    (enlace L2 L1)
    (enlace L2 L4)
    (enlace L4 L2)
    (enlace L4 L3)
    (enlace L3 L4)
    (enlace L2 L5)
    (enlace L5 L2)
    (enlace L5 L6)
    (enlace L6 L5)
    (enlace L4 L6)
    (enlace L6 L4)
    
)

(:goal (and
    ;todo: put the goal condition here
    (afueraambulancia enfermo1)
    (elocalizacion enfermo1 L1)
    (afueraambulancia enfermo2)
    (elocalizacion enfermo2 L1)
    (afueraambulancia enfermo3)
    (elocalizacion enfermo3 L1)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
