class LicensesStatus < EnumerateIt::Base
  associate_values never_used: 0, used: 1, spent_time: 2, canceled: 3
end
