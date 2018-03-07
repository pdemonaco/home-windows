# GPG Configuration

These instructions assume you already have a GPG key which was created on a linux machine.

1. Install [gpg4win](https://www.gpg4win.org/get-gpg4win.html) on the target windows machine (as administrator).
2. Leave the components selection as defaults.
3. Run Kleopatra when it completes.
4. Determine which key to export from your Linux machine.

    ```bash
    gpg --list-secret-keys --keyid-format LONG
    # Get the part that comes after the 'rsa4096/'
    ```
5. Once you know the Key ID export it!

    ```bash
    KEY_ID=<ID>
    gpg --armor --export "${KEY_ID}" > public_key.asc
    gpg --armor --export-secret-keys "${KEY_ID}" > private_key.asc
    ```
6. SCP the keys to the target machine. (Or use some other form of secure encrypted transport)
7. Select both keys via the import tool in Kleopatra and delete the temporary transfer files.
8. Finally, ensure git is configured to use your key.

    ```bash
    KEY_ID=<ID>
    git config --global user.signingkey "${KEY_ID}"
    git config --global commit.gpgsign true
   	git config --global gpg.program "C:\Program Files (x86)\GnuPG\bin\gpg.exe"
    ```

# External Resources

* [Github Instructions](https://help.github.com/articles/signing-commits-using-gpg/)
* [gpg4win](https://www.gpg4win.org/)
