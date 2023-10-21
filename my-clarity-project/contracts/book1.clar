(define-non-fungible-token nft uint)

;; Define a data map to store the ownership of each NFT
(define-map ownership
  {token-id: uint}
  {owner: principal})
;; Function to mint a new NFT
(define-public (mint (token-id uint) (recipient principal))
  (begin
    (unwrap! (nft-mint? nft token-id recipient) (err u1))
    (map-set ownership { token-id: token-id } { owner: recipient })
    (ok token-id)))

;; Function to transfer an NFT
(define-public (transfer (token-id uint) (new-owner principal))
  (let ((current-owner (unwrap! (map-get? ownership { token-id: token-id }) (err u2))))
    (if (is-eq tx-sender (get owner current-owner))
        (begin
            (unwrap! (nft-transfer? nft token-id (get owner current-owner) new-owner) (err u3))
            (map-set ownership { token-id: token-id } { owner: new-owner })
            (ok token-id))
        (err u4))))
;; token definitions
;; 

;; constants
;;

;; data vars
;;

;; data maps
;;

;; public functions
;;

;; read only functions
;;

;; private functions
;;

