(load "csv-parser.lisp")
(in-package :csv-parser)

;; (read-from-string STRING)
;; This function converts the input STRING to a lisp object.
;; In this code, I use this function to convert lists (in string format) from csv file to real lists.

;; (nth INDEX LIST)
;; This function allows us to access value at INDEX of LIST.
;; Example: (nth 0 '(a b c)) => a

;; !!! VERY VERY VERY IMPORTANT NOTE !!!
;; FOR EACH ARGUMENT IN CSV FILE
;; USE THE CODE (read-from-string (nth ARGUMENT-INDEX line))
;; Example: (mypart1-funct (read-from-string (nth 0 line)) (read-from-string (nth 1 line)))

;; DEFINE YOUR FUNCTION(S) HERE
(defun insert-2(list_i number index)
	(setq counter_2 (+ counter_2 1)) 
	(if (= counter_2 index)
		(cons number (cdr list_i))
		(insert-2 (cdr list_i) number index)
	)	
)

(defun insert-1(list_i number index)
	(setq counter_1 (+ counter_1 1)) 
	(setq z (cons (car list_i) z)) 
	(if  (= counter_1 index)
		(reverse z)
		(insert-1 (cdr list_i) number index)
	)	
)

(defun insert-n(list_i number index)
	(setq counter_2 0)
	(setq counter_1 0)
	(setq z '())
	(if (= index 0)
		(append (cons number z) list_i) 
		(append (insert-1 list_i number index) (insert-2 list_i number index)) 
	)
)
;; MAIN FUNCTION
(defun main ()
  (with-open-file (stream #p"input_part3.csv")
    (loop :for line := (read-csv-line stream) :while line :collect
      (format t "~a~%"
      ;; CALL YOUR (MAIN) FUNCTION HERE
 		(insert-n (read-from-string (nth 0 line)) (read-from-string (nth 1 line)) (read-from-string (nth 2 line)))

      )
    )
  )
)

;; CALL MAIN FUNCTION
(main)
