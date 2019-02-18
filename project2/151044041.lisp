(defun parser (liste)	; fonksiyon tanimi.
	(setq result (car liste))	; ilk listeyi al
	(with-open-file (str "151044041.tree"		
 		:direction :output	
		:if-exists nil	; dosya varsa olusturma.
	    :if-does-not-exist :create)	; dosya yoksa olustur.
		  (format str "; DIRECTIVE: print~C" #\linefeed))	
	(with-open-file (str "151044041.tree"
 		:direction :output
		:if-exists :append ; dosya varsa yazmaya devam et.
	    :if-does-not-exist :create)
		  (format str "~s~%" result))
	(if (null (cdr liste))  
		result	; liste bitince sonucu dondur.
		(cons result (parser (cdr liste))) ; listenin cdr ini tekrar recursive fonksiyona gonder. 
	)
)
; Fatih Dural
; 151044041