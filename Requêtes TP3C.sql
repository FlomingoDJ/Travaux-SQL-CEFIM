-- Afficher toutes les factures avec le nom des clients correspondant
select facture.*, clients.nom from clients
inner join projet on  clients.id = projet.client_id
inner join devis on  projet.id = devis.projet_id
inner join facture on devis.id = facture.devis_id

-- Afficher le nombre de factures par client (afficher 0 factures s'il n'y a pas de factures)
-- Utiliser left join plutôt que inner join pour obtenir les valeurs nulles
select count(facture.id), clients.nom from clients
left join projet on  clients.id = projet.client_id
left join devis on  projet.id = devis.projet_id
left join facture on devis.id = facture.devis_id
group by clients.id

-- afficher le chiffre d'affaire par client
select sum(facture.total), clients.nom from clients
left join projet on  clients.id = projet.client_id
left join devis on  projet.id = devis.projet_id
left join facture on devis.id = facture.devis_id
group by clients.id

-- afficher le CA total
select sum(facture.total) from facture

-- afficher la somme des factures en attente de paiement
select sum(facture.total) from facture where facture.date_paiement is null

-- afficher les factures en retard de paiement 30 jours max avec le nombre de jours de retard
select facture.*,datediff(curdate(),date_crea) as jours_retard from facture where datediff(curdate(),date_crea) <= 30
