return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model= "gpt-4o"
      -- See Configuration section for options
    },
    config = function()
      -- local select = require('CopilotChat.select') -- 他のpluginが必要
      require('CopilotChat').setup {
        prompts = {
          Explain = {
            prompt = '/COPILOT_EXPLAIN カーソル上のコードの説明を段落をつけて書いてください。',
          },
          Tests = {
            prompt = [['/COPILOT_TESTS カーソル上のコードの詳細な単体テスト関数をrspecで書いてください。
              describeでメソッド名をインスタンスメソッドの場合は「#」、クラスメソッドの場合は「.」で始めてください。
              条件分岐の場合はcontextをテスト対象の場合itを利用してください。
              テストの説明は全て日本語で作成し、contextは「~場合」をitには「~こと」のように作成してください。
            ]]
          },
          Fix = {
            prompt = '/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。',
          },
          Optimize = {
            prompt = '/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。',
          },
          Docs = {
            prompt = '/COPILOT_REFACTOR 選択したコードのドキュメントを書いてください。ドキュメントをコメントとして追加した元のコードを含むコードブロックで回答してください。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptのJSDoc、Pythonのdocstringsなど）',
          },
          REVIEW = {
            prompt = '/COPILOT_REVIEW このコードの可読性、パフォーマンス、セキュリティ、バグの可能性についてレビューしてください。コードの問題点を指摘し、改善案を提案してください。',
          },
          FixDiagnostic = {
            prompt = 'ファイル内の次のような診断上の問題を解決してください：',
            -- selection = select.diagnostics,
          },
          Commit = {
            prompt = '次の変更をコミットするためのGitメッセージを日本語で生成してください：',
            -- selection = select.git_changes,
          },
          CommitReview = {
            prompt = [[
              > #git:staged
              > #git:unstaged

              項目ごとにまとめてほしい。特に問題なさそうな場合は「良さそう」と書いてほしい

              全体の内容
              1. コードの可読性が高いか確認してほしい
              2. 修正した差分の中で何か誤字がないか確認してほしい

              テストコード
              1. 追加したコードに対してテストが網羅できているか確認してほしい
              2. 差分に入っている修正したコードに対してテストコードが十分網羅できているか確認してほしい
              3. モデル名を直接書くのではなく、日本語として読みやすくなっているか確認してほしい

              修正の内容にControllerファイルが存在する場合(ない場合は回答しなくても大丈夫)
              1. N + 1が起きそうな箇所がないか確認してほしい
              2. エラーハンドリングができているか確認してほしい
            ]],
            selection = require('CopilotChat.select').gitdiff
            -- selection = select.git_changes,
          }
        }
      }
    end
    -- See Commands section for default commands if you want to lazy load on them
  },
}
