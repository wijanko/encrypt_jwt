require 'byebug'
require "openssl"
require "jwt"

id_token = ARGV[0] || File.read("./id_token")
public_key = File.read("./public.pem")

rsa_public = OpenSSL::PKey::RSA.new(public_key)
decoded_id_token = JWT.decode(id_token, rsa_public, true, { algorithm: 'RS256' }).first

byebug

puts "end"

