/* HRMORG (Unterstellung) doppelte Einträge für einen Stichtag aus lp_t_tmp_OrgStichtag */
SELECT	tag.Datum
	,	org.ORGCHDOU
	,	org.ORGPNTOU
	,	org.ORSID
FROM	lp_t_stage_HRMORG org
INNER JOIN lp_t_tmp_OrgStichtag tag ON
	tag.Datum BETWEEN org.ORGFROM AND org.ORGUNTIL
GROUP BY tag.Datum
	,	org.ORGCHDOU
	,	org.ORGPNTOU
	,	org.ORSID
HAVING COUNT(*) > 1
		
/* HRMOUN (Org-Einheiten) doppelte Einträge für einen Stichtag aus lp_t_tmp_OrgStichtag */
SELECT	tag.Datum
	,	oun.OUNKEY
FROM	lp_t_stage_HRMOUN oun
INNER JOIN lp_t_tmp_OrgStichtag tag ON
	tag.Datum BETWEEN oun.OUNFROM AND oun.OUNUNTIL
GROUP BY tag.Datum
	,	oun.OUNKEY
HAVING COUNT(*) > 1
		
