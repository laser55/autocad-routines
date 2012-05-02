(defun c:calculatearea ()
    (vl-load-com)
    (setvar "cmdecho" 0)
    (setq point (getpoint "Select internal point:"))
    (while point
	(command "_-boundary" point "")
	(princ)
	(setq reg (entlast)
	      vreg (vlax-ename->vla-object reg)
	      area (vla-get-area vreg)
	      text (strcat "\nThe area is " (rtos area) " square feet, and " (rtos (/ area 43560)) " acres.")
	)
	(entdel
	    (entlast)
	)
	(princ text)
	(princ)
	(setq point (getpoint "\nSelect internal point:"))
    )
    (princ)
)