{
  name: 'xp'
  description: '''Handy tools for eXtreme Programming'''
  
  keywords: ['xp', 'extreme', 'programming', 'git', 'tools', 'utility', 'utilities', 'tool', 'pair']
  
  version: '0.1.0'
  
  author: 'Feisty Studios <xp@feistystudios.com> (http://feistystudios.com/)'
  
  licenses: [
    {
      type: 'FEISTY'
      url: 'http://github.com/feisty/license/raw/master/LICENSE'
    }
  ]
  
  contributors: [
    'Nicholas Kinsey <nicholas.kinsey@feistystudios.com>'
  ]
  
  repository:
    type: 'git'
    url: 'http://github.com/feisty/xp.git'
    private: 'git@github.com:feisty/xp.git'
    web: 'http://github.com/feisty/xp'
  
  bugs:
    mail: 'xp@feistystudios.com'
    web: 'http://github.com/feisty/xp/issues'
    
  directories:
    lib: './lib'
    doc: './doc'
    bin: './bin'
  
  dependencies:
    'coffee-script': '>= 1.0.0'
    'optimist': '>= 0.1.3'
    
  engines:
    node: '>= 0.3.4'
}