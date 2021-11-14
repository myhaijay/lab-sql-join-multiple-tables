-- 1. Write a query to display for each store its store ID, city, and country.
select store_id as store, city, country from store as s
join address as a using(address_id)
join city as c using(city_id)
join country as ct using(country_id)
group by store_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(amount) as Returns_$ from store as s
join staff as stf on s.store_id = stf.store_id
join payment as p on stf.staff_id = p.staff_id
group by s.store_id;

-- 3. What is the average running time of films by category?
select name as category, avg(length) as Running_Time  from film as f
join film_category as fc using(film_id)
join category as c using(category_id)
group by name;

-- 4. Which film categories are longest?
select name as category, avg(length) as Running_Time  from film as f
join film_category as fc using(film_id)
join category as c using(category_id)
group by name
order by Running_Time desc
limit 1;

-- 5. Display the most frequently rented movies in descending order.
select title, count(rental_id) as Frequency from film as f
join inventory as i using(film_id)
join rental as r using(inventory_id)
group by title
order by Frequency desc;

-- 5. List the top five genres in gross revenue in descending order.
select name, sum(amount) as Revenue from category
join film_category using(category_id)
join inventory using(film_id)
join rental using(inventory_id)
join payment using(rental_id)
group by name
order by Revenue desc
limit 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
select title, store_id from film
join inventory using(film_id)
join store using(store_id)
where title = 'ACADEMY DINOSAUR' and store_id = 1;

-- Yes "Academy Dinosaur" is available for rent in Store 1.

