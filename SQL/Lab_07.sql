# Lab 07 
#=====================
# zad 1.2
#=====================	
select*from kreatura k 
left join uczestnicy u on k.idkreatury=u.id_uczestnika
where u.id_uczestnika is null;
#=====================
# zad 1.3
#=====================
select w.nazwa , sum(e.ilosc) from wyprawa w 
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join ekwipunek e on id_uczestnika=e.idkreatury
group by w.id_wyprawy;
#=====================
# zad 2.1
#=====================

selectoup_concat(nazwa separator '|')
from kreatura group by rodzaj;

# Lab 07 
#=====================
# zad 1.2
#=====================	
select*from kreatura k 
left join uczestnicy u on k.idkreatury=u.id_uczestnika
where u.id_uczestnika is null;
#=====================
# zad 1.3
#=====================
select w.nazwa , sum(e.ilosc) from wyprawa w 
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join ekwipunek e on id_uczestnika=e.idkreatury
group by w.id_wyprawy;
#=====================
# zad 2.1
#=====================
select w.nazwa, count(u.id_uczestnika) , group_concat( k.nazwa)
from wyprawa w inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join kreatura k on k.idkreatury=u.id_uczestnika
group by w.id_wyprawy;
#=====================
# zad 2.2
#=====================
select 
w.data_rozpoczecia, ew.kolejnosc, w.nazwa , s.nazwa,k.nazwa as kierownik 
from wyprawa w 
inner join kreatura k on k.idkreatury=w.kierownik
inner join etapy_wyprawy ew on w.id_wyprawy=ew.idwyprawy
inner join sektor s on ew.sektor=s.id_sektora
order by w.data_rozpoczecia, ew.kolejnosc;
#=====================
# zad 3.1
#=====================
#ifnull
select ifnull(idkreatury,'brak nazwy kreatury') from ekwipunek;
#=====================
select s.nazwa, count(ew.sektor) from etapy_wyprawy ew
inner join sektor s on ew.sektor=s.id_sektora
group by s.nazwa with rollup;
#=====================
# zad 3.2
#=====================
select k.nazwa,  if(count(u.id_uczestnika)>0,'brał udział', 'nie brał udziału' ) as 'brał udział czy nie?'
from kreatura k left join uczestnicy u 
on u.id_uczestnika=k.idkreatury group by k.nazwa;
#=====================
# zad 4.1
#=====================

select w.nazwa, sum(length(ew.dziennik)) as 'liczba znaków'
from wyprawa w inner join etapy_wyprawy ew
on  ew.idwyprawy=w.id_wyprawy group by w.nazwa
having sum(length(ew.dziennik))<400;

#=====================
# zad 4.2
#=====================

select u.id_wyprawy,sum(e.ilosc*z.waga)/count(distinct u.id_uczestnika) as srednia_waga
from uczestnicy u left join ekwipunek e on u.id_uczestnika=e.idkreatury 
left join zasob z on z.idzasobu=e.idzasobu group by u.id_wyprawy;
 
#=====================
# zad 5.1
#=====================


