defmodule HugoToEExConverter.AssetsTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Assets

  @img_path "test/support/converted/assets/static/module/subject/trybe.svg"
  @js_file_path "test/support/converted/assets/static/module/file.js"
  @json_file_path "test/support/converted/assets/static/module/file.json"
  @pdf_file_path "test/support/converted/assets/static/module/file.pdf"
  @sql_file_path "test/support/converted/assets/static/module/file.sql"
  @zip_file_path "test/support/converted/assets/static/module/folder.zip"
  @txt_file_path "test/support/converted/assets/static/module/file.txt"

  setup do
    on_exit(fn ->
      File.rm!(@img_path)
      File.rm!(@js_file_path)
      File.rm!(@json_file_path)
      File.rm!(@pdf_file_path)
      File.rm!(@sql_file_path)
      File.rm!(@zip_file_path)
      File.rm!(@txt_file_path)
    end)
  end

  describe "copy/1" do
    test "copies assets from a folder to another" do
      Assets.copy("test/support/convert")

      assert File.exists?(@img_path)
      assert File.exists?(@js_file_path)
      assert File.exists?(@json_file_path)
      assert File.exists?(@pdf_file_path)
      assert File.exists?(@sql_file_path)
      assert File.exists?(@zip_file_path)
      assert File.exists?(@txt_file_path)
    end
  end
end
