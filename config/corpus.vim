if has('nvim')
  lua <<
    CorpusDirectories = {
      ['~/Documents/Corpus'] = {
        autocommit = true,
        autoreference = 1,
        autotitle = 1,
        base = './',
        transform = 'local',
      },
      ['~/coding/wiki'] = {
        autocommit = false,
        autoreference = 1,
        autotitle = 1,
        base = '/wiki/',
        tags = {'wiki'},
        transform = 'web',
      },
  }
.
endif
