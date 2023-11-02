local util = require('llm.util')
local llamacpp = require('llm.providers.llamacpp')

require('llm').setup({
    hl_group = 'Substitute',
--    prompts = util.module.autoload('prompt_library'),
    default_prompt = {
        provider = llamacpp,
        builder = function(input, context)
            return {
                messages = {
                    {
                        role = 'system',
                        content = 'You are a 10x super elite programmer. Continue only with code. Do not write tests, examples, or output of code unless explicitly asked for.',
                    },
                    {
                        role = 'user',
                        content = input,
                    }
                }
            }
        end
    }
})
