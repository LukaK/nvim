return require('yaml-companion').setup {

  builtin_matchers = {
    -- detect kubernetes files based on content
    kubernetes = { enabled = true },
    cloud_init = { enabled = true },
  },

  schemas = {
    {
      name = 'Argo CD Application',
      uri = 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json',
    },
  },

  lspconfig = {

    filetypes = { 'yaml', 'yml' },

    settings = {

      yaml = {

        -- disable built-in schemaStore support ( needed by schemastore plugin )
        schemaStore = {
          enable = false,
          url = '',
        },

        -- select schemas from schemastore
        schemas = require('schemastore').yaml.schemas {

          -- manually select schemas from schemastore if file triggers are ok
          -- see: https://github.com/b0o/SchemaStore.nvim/blob/main/lua/schemastore/catalog.lua
          select = {

            -- github workflows
            'GitHub Workflow',
            'GitHub Workflow Template Properties',

            -- docker
            'docker-compose.yml', -- file types: docker-compose(yaml|yml), compose.*.(yaml|yml)

            -- kubernetes
            'kustomization.yaml', -- file types: kustomization.(yaml|yml)
            'helmfile',

            -- ansible
            'Ansible Vars File',
            'Ansible Tasks File',
            'Ansible Playbook',
            'Ansible Requirements', -- redefined below

            -- aws
            'AWS CloudFormation',
            'AWS SAM CLI Samconfig',
            'AWS CloudFormation Serverless Application Model (SAM)', -- redefined below

            -- tools
            'yamllint', -- file types: .yamllint, **/.yamllint.(yaml,yml)
          },

          replace = {
            -- aws
            ['AWS CloudFormation Serverless Application Model (SAM)'] = {
              url = 'https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json',
              name = 'AWS CloudFormation Serverless Application Model (SAM)',
              description = 'AWS SAM schema',
              fileMatch = {
                'template.yaml',
                'serverless.template',
                '*.sam.json',
                '*.sam.yml',
                '*.sam.yaml',
                'sam.json',
                'sam.yml',
                'sam.yaml',
                'serverless.yaml',
                'serverless.yml',
              },
            },

            -- ansible
            ['Ansible Requirements'] = {
              url = 'https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/requirements.json',
              name = 'Ansible Requirements',
              description = 'Ansible requirements file schema',
              fileMatch = { 'requirements.yml', 'requirements.yaml' },
            },
          },

          -- additional schemas not in the schemastore
          extra = {
            {
              url = 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json',
              name = 'Argo CD Application',
              fileMatch = 'argocd-application.yaml',
              description = 'ArgoCd applications schema',
            },
          },
        },

        -- custom tags for aws cloudformation
        customTags = {
          '!And scalar',
          '!And map',
          '!And sequence',
          '!If scalar',
          '!If map',
          '!If sequence',
          '!Not scalar',
          '!Not map',
          '!Not sequence',
          '!Equals scalar',
          '!Equals map',
          '!Equals sequence',
          '!Or scalar',
          '!Or map',
          '!Or sequence',
          '!FindInMap scalar',
          '!FindInMap mappping',
          '!FindInMap sequence',
          '!Base64 scalar',
          '!Base64 map',
          '!Base64 sequence',
          '!Cidr scalar',
          '!Cidr map',
          '!Cidr sequence',
          '!Ref scalar',
          '!Ref map',
          '!Ref sequence',
          '!Sub scalar',
          '!Sub map',
          '!Sub sequence',
          '!GetAtt scalar',
          '!GetAtt map',
          '!GetAtt sequence',
          '!GetAZs scalar',
          '!GetAZs map',
          '!GetAZs sequence',
          '!ImportValue scalar',
          '!ImportValue map',
          '!ImportValue sequence',
          '!Select scalar',
          '!Select map',
          '!Select sequence',
          '!Split scalar',
          '!Split map',
          '!Split sequence',
          '!Join scalar',
          '!Join map',
          '!Join sequence',
        },
      },
    },
  },
}
