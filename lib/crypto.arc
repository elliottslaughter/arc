($ (require file/md5))
(load "lib/lang.arc")

(def md5 (str)
  (($ bytes->string/utf-8) (($ md5) (($ string->bytes/utf-8) str))))

(def sha224 (data)
  (perl subprocess “
	use Digest::SHA qw(sha224_hex);
	sha224_hex(«data»);
	”))

(def sha384 (data)
  (perl subprocess “
	use Digest::SHA qw(sha384_hex);
	sha384_hex(«data»);
	”))

(def sha512 (data)
  (perl subprocess “
	use Digest::SHA qw(sha512_hex);
	sha512_hex(«data»);
	”))


(def whirlpool (data)
  (perl subprocess “
        use Digest;
	
        my $whirlpool = Digest->new( 'Whirlpool' );

	$whirlpool->add(«data»);
        $whirlpool->hexdigest;
	”))

; TODO need a more sane return value than a string
;(def aes-encrypt (key plaintext)
;  (perl subprocess “
;	use Crypt::OpenSSL::AES;
;
;	my $cipher = new Crypt::OpenSSL::AES(«key»);
;	
;	$cipher->encrypt(«plaintext»);
;	”))
;
;(def aes-decrypt (key ciphertext)
;  (perl subprocess “
;	use Crypt::OpenSSL::AES;
;
;	my $cipher = new Crypt::OpenSSL::AES(«key»);
;	
;	$cipher->decrypt(«ciphertext»);
;	”))
