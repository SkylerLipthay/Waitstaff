module OptionGroupsHelper
  def self.max_selection_options
    [
      ['Select zero or more options', '0'],
      ['Select exactly one option', '1'],
      ['Select exactly two options', '2'],
      ['Select exactly three options', '3'],
      ['Select exactly four options', '4'],
      ['Select exactly five options', '5']
    ]
  end
end