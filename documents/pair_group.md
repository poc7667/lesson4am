# Schema
## Table Name: pair_groups(PairGroup)
rails g scaffold PairGroup user_id:integer title:string description: text members: text
belongs_to :user
has_many :pair_records
### columns
* user_id
* title
* description
* members (text, hash)

		{
			male: []
			female: []
		}

## Table Name: pair_records(PairRecord)
rails g model PairRecord user_id:integer pair_group_id:integer condition:text record:text
belongs_to :pair_group
belongs_to :user
### Columns 
* user_id
* pair_group_id
* condition
	
		{
			groups:
			excluded_members:
		}
	
* record

		[
			[{<NAME>,<GENDER>},{},{},{}]
		]