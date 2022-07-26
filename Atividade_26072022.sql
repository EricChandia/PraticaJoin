--1: Utilizando uma query, obtenha todos os usuários (users) que vivem na cidade (cities) cujo nome seja “Rio de Janeiro”.
select users.id as "userId", users.name as "userName", cities.name as "cityName" from users
join cities on users."cityId" = cities.id where cities.name = 'Rio de Janeiro';

--2: Utilizando umas query, obtenha todos os depoimentos (testimonials) cadastrados, incluindo o nome do remetente e do destinatário.
select testimonials.id, writers.name as writer, recipient.name as recipient, testimonials.message from testimonials
join users as writers on testimonials."writerId" = writers.id
join users as recipient on testimonials."recipientId" = recipient.id;

--3: Utilizando uma query, obtenha todos os cursos (courses) que o usuário com id 30 já finalizou, incluindo o nome da escola. O que indica que um usuário terminou um curso é o campo status da tabela educations, que deve estar como "finished
select educations."userId" as id, users.name, courses.name as course, schools.name as school, educations."endDate" from educations
join courses on educations."courseId" = courses.id
join users on educations."userId" = users.id
join schools on educations."schoolId" = schools.id
where status = 'finished' and "userId" = 30;

--4: Utilizando uma query, obtenha as empresas (companies) para as quais o usuário com id 50 trabalha atualmente. Para filtrar quem trabalha atualmente, utilize o campo endDate da tabela experiences. Se ele estiver null (IS NULL), significa que a pessoa ainda não encerrou a experiência dela na empresa, ou seja, está trabalhando lá
select experiences."userId" as id, users.name as name, roles.name as role, companies.name as company, experiences."startDate" from experiences
join companies on experiences."companyId" = companies.id
join roles on experiences."roleId" = roles.id
join users on experiences."userId" = users.id
where "userId" = 50 and "endDate" IS NULL;

