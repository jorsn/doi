# extra shell.nix needed for lorri
let pkg = (import ./. {});
in pkg.env or pkg
