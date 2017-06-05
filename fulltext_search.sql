SELECT * FROM sites WHERE MATCH(description,kw,title) AGAINST('frigo')

SELECT * FROM sites WHERE MATCH(description,kw,title) AGAINST('hotel fakarava')
=> recherche les lignes dont desc,kw OU title contien fakarava

CREATE FULLTEXT INDEX searchindex ON Entries(title, tags, entry);

show index from sites