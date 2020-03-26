pg_dump -Fp -h geodb.verw.rootso.org -d sogis -U bjsvwneu --insert -O -x -t public.alw_bergwege >alw_bergwege.dump
# after pg_dump, edit the dump file in text editor and optionally create new schema and change the search path to 
# import into a new schema
