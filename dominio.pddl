;Header and description

(define (domain Ambulancia)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions :conditional-effects)

(:types

    ambulancia localizacion enfermo - object
    ;hospital enfermo - localizable
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here

    (ambulanciaestado ?ambulancia1 - ambulancia)
    (alocalizacion ?ambulancia1 - ambulancia ?localizacion1 - localizacion)
    (dentroambulancia ?enfermo1 - enfermo ?ambulancia1 - ambulancia)
    (elocalizacion ?enfermo1 - enfermo ?localizacion1 - localizacion)
    (afueraambulancia ?enfermo1 - enfermo)
    (enlace ?localizacion1 - localizacion ?localizacion2 - localizacion)  

)

(:action Conducir
    :parameters (?a - ambulancia ?localizacionOrigen - localizacion ?localizacionDestino - localizacion)
    :precondition (and 

        (ambulanciaestado ?a)
        (alocalizacion ?a ?localizacionOrigen)
        (enlace ?localizacionOrigen ?localizacionDestino)

    )
    :effect (and 
    
        (not (alocalizacion ?a ?localizacionOrigen))
        (alocalizacion ?a ?localizacionDestino)
        (forall (?e - enfermo)
              (when (and
                (dentroambulancia ?e ?a)
                (elocalizacion ?e ?localizacionOrigen)
                (enlace ?localizacionOrigen ?localizacionDestino)
               )
              (and
                (not (elocalizacion ?e ?localizacionOrigen))
                (elocalizacion ?e ?localizacionDestino)
               )))
    
    )
)

(:action Subir
    :parameters (?e - enfermo ?a - ambulancia ?l - localizacion)
    :precondition (and 

        (ambulanciaestado ?a)
        (alocalizacion ?a ?l)
        (afueraambulancia ?e)
        (elocalizacion ?e ?l)

    )
    :effect (and
    
        (not (afueraambulancia ?e))
        (dentroambulancia ?e ?a)

    )
)

(:action Bajar
    :parameters (?e - enfermo ?a - ambulancia ?l - localizacion)
    :precondition (and 

        (ambulanciaestado ?a)
        (alocalizacion ?a ?l)
        (dentroambulancia ?e ?a)
        (elocalizacion ?e ?l)

    )
    :effect (and
    
        (not (dentroambulancia ?e ?a))
        (afueraambulancia ?e)

    )
)


)