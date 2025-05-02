-- ~/.config/nvim/lua/plugins/neocodeium.lua

return {
  'monkoose/neocodeium',

  -- Opsiyonel: Bağımlılıklar (Eğer nvim-cmp ile tamamlama entegrasyonu istiyorsanız)
  dependencies = {
    'nvim-lua/plenary.nvim', -- Birçok eklenti için gerekli olabilir
    'hrsh7th/nvim-cmp', -- nvim-cmp tamamlama arayüzü için
    -- Eğer varsa diğer gerekli bağımlılıklar
  },

  -- Eklentinin ne zaman yükleneceğini belirleyebilirsiniz (opsiyonel)
  -- event = "VeryLazy", -- Çok tembel yükle (genellikle iyi bir başlangıç)
  -- Veya belirli komutlar çalıştırıldığında:
  -- cmd = { "Codeium" }, -- :Codeium komutu çalıştırıldığında yükle

  config = function()
    -- NeoCodeium'u yapılandır
    require('neocodeium').setup {
      -- Burada NeoCodeium'a özel ayarları yapabilirsiniz.
      -- Örneğin, otomatik tetiklemeyi kapatmak için:
      -- enable_autotrigger = false,

      -- Tüm ayarlar için NeoCodeium belgelerine bakın:
      -- https://github.com/monkoose/neocodeium?tab=readme-ov-file#configuration
    }

    vim.keymap.set('i', '<A-f>', function()
      require('neocodeium').accept()
    end)
    vim.keymap.set('i', '<A-w>', function()
      require('neocodeium').accept_word()
    end)
    vim.keymap.set('i', '<A-a>', function()
      require('neocodeium').accept_line()
    end)
    vim.keymap.set('i', '<A-e>', function()
      require('neocodeium').cycle_or_complete()
    end)
    vim.keymap.set('i', '<A-r>', function()
      require('neocodeium').cycle_or_complete(-1)
    end)
    vim.keymap.set('i', '<A-c>', function()
      require('neocodeium').clear()
    end)
    -- Önemli Not: Kurulumdan sonra Codeium hesabınızla kimlik doğrulaması yapmanız gerekebilir.
    -- Bunun için Neovim içinde ':Codeium Auth' komutunu çalıştırın.
    -- Durumu kontrol etmek için ':Codeium Status' komutunu kullanabilirsiniz.
  end,
}
