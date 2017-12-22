let
  self = hp: with hp; {
    formatters = [
      stylish-haskell
      hlint
      hindent
      brittany
    ];

    pretty-printing = [
      prettyprinter
      prettyprinter-ansi-terminal
    ];

    development-servers = [
      ghcid
    ];

    data-structures = [
      text
      bytestring
      vector
      containers
    ];

    monad-transformers = [
      mtl
      transformers
      exceptions
      safe-exceptions
    ];

    conduitFull = [ 
      conduit 
      conduit-combinators 
    ];

    literate-haskell = [
      markdown-unlit
      hscolour
    ];

    trifectaFull = [ 
      trifecta 
      parsers 
    ];

    streamingFull = [
      streaming
      streaming-binary
      streaming-bytestring
      streaming-conduit
      streaming-utils
    ];

    opengl = [
      gl
      GLUT
      GPipe
      GPipe-GLFW
    ];

    aesonFull = [
      aeson
      aeson-better-errors
      aeson-pretty
    ];

    control = [
      comonad
      contravariant
      adjunctions
      bifunctors
      lens
      foldl
    ];

    machinesFull = [
      machines
      machines-binary
      machines-bytestring
      machines-directory
      machines-io
      machines-process
    ];

    web-templating = [
      clay
      lucid
      type-of-html
      blaze
    ];
  };

in self
