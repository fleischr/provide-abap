INTERFACE zif_proubc_vault
  PUBLIC .

  "vault key types
  CONSTANTS: c_vaultkey_sym  TYPE string VALUE 'symmetric',
             c_vaultkey_asym TYPE string VALUE 'assymetric'.

  "vault key specs - symmetric
  CONSTANTS: c_vaultkey_spec_aes256 type string value 'AES-256-GCM'.
  CONSTANTS: c_vaultkey_spec_chacha20 TYPE string VALUE 'ChaCha20'.
               "RSA
  CONSTANTS: c_vaultkey_spec_RSA type string value 'RSA'.

  "vault key specs - assymetric
  CONSTANTS: c_vaultkey_spec_bjj type string value 'babyJubJub'.
  CONSTANTS: c_vaultkey_spec_C25519 type string value 'C25519'.
  CONSTANTS: c_vaultkey_spec_Ed25519 type string value 'Ed25519'.
  CONSTANTS: c_vaultkey_spec_nats_Ed25519 type string value 'Ed25519-nkey'.
  CONSTANTS: c_vaultkey_spec_secp256k1 type string value 'secp256k1'.
  CONSTANTS: c_vaultkey_spec_BIP39 type string value 'BIP39'.

* POST - "Create a key: C25519"
* Operation id: Createakey:C25519
* Parameter: authorization, required, header
* Parameter: Content-Type, required, header
* Parameter: vault_id, required, path
* Response: 200
* Body schema: string
  METHODS create_key
    IMPORTING
      authorization TYPE string
      content_type TYPE string
      vault_id TYPE string
      body TYPE string
    RAISING cx_static_check.

* GET - "List keys"
* Operation id: Listkeys
* Parameter: authorization, required, header
* Parameter: Content-Type, required, header
* Parameter: vault_id, required, path
* Response: 200
* Body schema: string
  METHODS list_keys
    IMPORTING
      authorization TYPE string
      content_type TYPE string
      vault_id TYPE string
      body TYPE string
    RAISING cx_static_check.

* POST - "Derive a key: ChaCha20"
* Operation id: Deriveakey:ChaCha20
* Parameter: authorization, required, header
* Parameter: Content-Type, required, header
* Parameter: vault_id, required, path
* Response: 200
* Body schema: string
  METHODS derive_key
    IMPORTING
      authorization TYPE string
      content_type TYPE string
      vault_id TYPE string
      body TYPE string
    RAISING cx_static_check.

* DELETE - "Delete a key"
* Operation id: Deleteakey
* Parameter: authorization, required, header
* Parameter: Content-Type, required, header
* Parameter: vault_id, required, path
* Parameter: key_id, required, path
* Response: 200
  METHODS delete_key
    IMPORTING
      authorization TYPE string
      content_type TYPE string
      vault_id TYPE string
      key_id TYPE string
    RAISING cx_static_check.

* GET - "List secrets"
* Operation id: Listsecrets
* Parameter: authorization, required, header
* Parameter: Content-Type, required, header
* Parameter: vault_id, required, path
* Response: 200
  METHODS list_secrets
    IMPORTING
      authorization TYPE string
      content_type TYPE string
      vault_id TYPE string
    RAISING cx_static_check.

* POST - "Retreive secret"
* Operation id: Retreivesecret
* Parameter: authorization, required, header
* Parameter: Content-Type, required, header
* Parameter: vault_id, required, path
* Parameter: secret_id, required, path
* Response: 200
* Body schema: string
  METHODS retreive_secret
    IMPORTING
      authorization TYPE string
      content_type TYPE string
      vault_id TYPE string
      secret_id TYPE string
      body TYPE string
    RAISING cx_static_check.

* DELETE - "Delete secret"
* Operation id: Deletesecret
* Parameter: authorization, required, header
* Parameter: Content-Type, required, header
* Parameter: vault_id, required, path
* Parameter: secret_id, required, path
* Response: 200
* Body schema: string
  METHODS delete_secret
    IMPORTING
      authorization TYPE string
      content_type TYPE string
      vault_id TYPE string
      secret_id TYPE string
      body TYPE string
    RAISING cx_static_check.

* POST - "Create Vault"
* Operation id: CreateVault
* Parameter: Content-Type, required, header
* Parameter: content-type, required, header
* Parameter: Authorization, required, header
* Response: 200
* Body schema: string
  METHODS create_vault
    IMPORTING
      content_type TYPE string
      authorization TYPE string
      body TYPE string
    RAISING cx_static_check.

* GET - "List Vaults"
* Operation id: ListVaults
* Parameter: Authorization, required, header
* Response: 200
* Body schema: string
  METHODS list_vaults
    IMPORTING
      authorization TYPE string
      body TYPE string
    RAISING cx_static_check.

* POST - "Create Seal/Unseal key"
* Operation id: CreateSeal/Unsealkey
* Parameter: authorization, required, header
* Parameter: Content-Type, required, header
* Response: 200
  METHODS createseal_unsealkey
    IMPORTING
      authorization TYPE string
      content_type TYPE string
    RAISING cx_static_check.

* POST - "Unseal vault"
* Operation id: Unsealvault
* Parameter: authorization, required, header
* Parameter: Content-Type, required, header
* Response: 200
* Body schema: string
  METHODS unseal_vault
    IMPORTING
      authorization TYPE string
      content_type TYPE string
      body TYPE string
    RAISING cx_static_check.

ENDINTERFACE.
