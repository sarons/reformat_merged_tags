# Given a list of tags that are merged to one another, format it such that each tag has it's merged ids

INPUT =[
        {id:1, merged_to:2},
        {id:2, merged_to:nil},
        {id:3, merged_to:2}
       ]
OUTPUT = [
          {id:1, merged_ids:[]},
          {id:2, merged_ids:[1,3]},
          {id:3, merged_ids:[]}
         ]

output_hash = {}
for tag in INPUT
  if tag[:merged_to]
    output_hash[tag[:merged_to]] ||= []
    output_hash[tag[:merged_to]] << tag[:id]
  end
end

output_list = []
for tag in INPUT
	output_list << {id: tag[:id],merged_ids: output_hash[tag[:id]] || [] }
end

p "It works!" if output_list == OUTPUT