module Itiel
	module Transformations
		class ConstantField
			include Itiel::InputOutputDefinitions

			attr_accessor :append

			def initialize(*args)
				self.append = args.first
			end

			def output
				@output ||= transform!
			end

			protected
			def transform!
				output_stream = []
				self.input.each do |row|
					output_stream << row.merge(self.append)
				end	
				output_stream
			end
		end
	end
end
