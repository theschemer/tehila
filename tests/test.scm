(require-extension lolevel)
(require-extension gl)
(require-extension glu)
(require-extension glut)
(require-extension srfi-4)

(load "list_utils.scm")
(load "binary_utils.scm")
(load "image_utils.scm")
(print "Ok, good to go. Enjoy")

(define (make-check-image)
  (let* ((check-image-height 64)
         (check-image-width 64)
         (buffer-size (* check-image-width check-image-height 4))
         (buffer (make-u8vector (* check-image-width check-image-height 4) 0))
         (dummy 255)
         (counter 0))
    (do ((i 0 (+ i 1))) ((> i (- check-image-height 1)) buffer)
      (do ((j 0 (+ j 1))) ((> j (- check-image-width 1)))
        (let ((c (if (or (equal? i 0) (equal? (remainder 64 i) 0)) 255 0)))
          (u8vector-set! buffer (+ counter 0) dummy)
          (u8vector-set! buffer (+ counter 1) dummy)
          (u8vector-set! buffer (+ counter 2) dummy)
          (u8vector-set! buffer (+ counter 3) 255)
          (set! counter (+ 4 counter)))))))

(print (make-check-image))
