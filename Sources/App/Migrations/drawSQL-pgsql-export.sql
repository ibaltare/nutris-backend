CREATE TABLE "users"(
    "id" BIGINT NOT NULL,
    "fullname" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "age" SMALLINT NOT NULL,
    "gender" VARCHAR(10) NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "height" INTEGER NOT NULL,
    "profile_photo_path" TEXT NULL,
    "id_country" INTEGER NOT NULL,
    "id_goal" INTEGER NOT NULL,
    "id_activity" INTEGER NOT NULL,
    "accept_terms" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
	
CREATE TABLE "personal_access_tokens"(
    "id" BIGINT NOT NULL,
    "tokenable_id" BIGINT NOT NULL,
    "token" VARCHAR(255) NOT NULL,
    "last_used_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "personal_access_tokens" ADD PRIMARY KEY("id");
	
CREATE TABLE "countries"(
    "id" INTEGER NOT NULL,
    "code" VARCHAR(10) NOT NULL,
    "country" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "countries" ADD PRIMARY KEY("id");
	
CREATE TABLE "physical_activity"(
    "id" INTEGER NOT NULL,
    "activity" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "physical_activity" ADD PRIMARY KEY("id");
	
CREATE TABLE "goals"(
    "id" INTEGER NOT NULL,
    "goal" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "goals" ADD PRIMARY KEY("id");
	
CREATE TABLE "allergies"(
    "id" INTEGER NOT NULL,
    "allergy" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "allergies" ADD PRIMARY KEY("id");
	
CREATE TABLE "user_allergies"(
    "id" BIGINT NOT NULL,
    "id_user" BIGINT NOT NULL,
    "id_allergy" INTEGER NOT NULL
);
ALTER TABLE
    "user_allergies" ADD PRIMARY KEY("id");
	
CREATE TABLE "recipes"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "preparation_time" SMALLINT NOT NULL,
    "photo_path" TEXT NULL,
    "proteins" SMALLINT NOT NULL,
    "fats" SMALLINT NOT NULL,
    "carbs" SMALLINT NOT NULL,
    "calories" SMALLINT NOT NULL,
    "rating" SMALLINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "recipes" ADD PRIMARY KEY("id");
	
CREATE TABLE "ingredients"(
    "id" BIGINT NOT NULL,
    "id_recipe" BIGINT NOT NULL,
    "ingredient" VARCHAR(255) NOT NULL,
    "amount" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "ingredients" ADD PRIMARY KEY("id");
	
CREATE TABLE "recipe_steps"(
    "id" BIGINT NOT NULL,
    "id_recipe" BIGINT NOT NULL,
    "step" SMALLINT NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "recipe_steps" ADD PRIMARY KEY("id");
	
CREATE TABLE "recipe_allergies"(
    "id" BIGINT NOT NULL,
    "id_recipe" BIGINT NOT NULL,
    "id_allergy" INTEGER NOT NULL
);
ALTER TABLE
    "recipe_allergies" ADD PRIMARY KEY("id");
	
CREATE TABLE "favorite_recipes"(
    "id" BIGINT NOT NULL,
    "id_user" BIGINT NOT NULL,
    "id_recipe" BIGINT NOT NULL,
	"created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "favorite_recipes" ADD PRIMARY KEY("id");
CREATE TABLE "groups"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "id_user_created" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "groups" ADD PRIMARY KEY("id");
CREATE TABLE "posts"(
    "id" BIGINT NOT NULL,
    "id_group" BIGINT NOT NULL,
    "id_user_created" BIGINT NOT NULL,
    "photo_path" TEXT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "posts" ADD PRIMARY KEY("id");
CREATE TABLE "post_comments"(
    "id" BIGINT NOT NULL,
    "id_post" BIGINT NOT NULL,
    "id_user" BIGINT NOT NULL,
    "comment" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "post_comments" ADD PRIMARY KEY("id");
CREATE TABLE "user_like_post"(
    "id" BIGINT NOT NULL,
    "id_user" BIGINT NOT NULL,
    "id_post" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "user_like_post" ADD PRIMARY KEY("id");
CREATE TABLE "plans"(
    "id" BIGINT NOT NULL,
    "id_user" BIGINT NOT NULL,
    "subscription_start" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "subscription_end" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "plans" ADD PRIMARY KEY("id");
CREATE TABLE "user_statistics"(
    "id" BIGINT NOT NULL,
    "id_user" BIGINT NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "registration_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "user_statistics" ADD PRIMARY KEY("id");
CREATE TABLE "foods"(
    "id" BIGINT NOT NULL,
    "food" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "foods" ADD PRIMARY KEY("id");
CREATE TABLE "diet"(
    "id" BIGINT NOT NULL,
    "id_user" BIGINT NOT NULL,
    "id_goal" INTEGER NOT NULL,
    "daily_protein" INTEGER NOT NULL,
    "daily_fat" INTEGER NOT NULL,
    "daily_carbs" INTEGER NOT NULL,
    "daily_calories" INTEGER NOT NULL,
    "current" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "diet" ADD PRIMARY KEY("id");
CREATE TABLE "diet_detail"(
    "id" BIGINT NOT NULL,
    "id_diet" BIGINT NOT NULL,
    "id_food" BIGINT NOT NULL,
    "id_recipe" BIGINT NOT NULL,
    "date_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "diet_detail" ADD PRIMARY KEY("id");
CREATE TABLE "user_groups"(
    "id" BIGINT NOT NULL,
    "id_group" BIGINT NOT NULL,
    "id_user" BIGINT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
	"updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "user_groups" ADD PRIMARY KEY("id");
CREATE TABLE "exercises"(
    "id" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "video_path" TEXT NOT NULL,
    "id_goal" INTEGER NOT NULL,
    "id_level" INTEGER NOT NULL,
    "id_classification" INTEGER NOT NULL
);
ALTER TABLE
    "exercises" ADD PRIMARY KEY("id");
CREATE TABLE "exercise_classification"(
    "id" INTEGER NOT NULL,
    "classification" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "exercise_classification" ADD PRIMARY KEY("id");
CREATE TABLE "exercise_level"(
    "id" INTEGER NOT NULL,
    "level" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "exercise_level" ADD PRIMARY KEY("id");
	
ALTER TABLE
    "user_allergies" ADD CONSTRAINT "user_allergies_id_user_foreign" FOREIGN KEY("id_user") REFERENCES "users"("id");
ALTER TABLE
    "personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_tokenable_id_foreign" FOREIGN KEY("tokenable_id") REFERENCES "users"("id");
ALTER TABLE
    "favorite_recipes" ADD CONSTRAINT "favorite_recipes_id_user_foreign" FOREIGN KEY("id_user") REFERENCES "users"("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_id_user_created_foreign" FOREIGN KEY("id_user_created") REFERENCES "users"("id");
ALTER TABLE
    "groups" ADD CONSTRAINT "groups_id_user_created_foreign" FOREIGN KEY("id_user_created") REFERENCES "users"("id");
ALTER TABLE
    "post_comments" ADD CONSTRAINT "post_comments_id_user_foreign" FOREIGN KEY("id_user") REFERENCES "users"("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_goal_foreign" FOREIGN KEY("id_goal") REFERENCES "goals"("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_country_foreign" FOREIGN KEY("id_country") REFERENCES "countries"("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_activity_foreign" FOREIGN KEY("id_activity") REFERENCES "physical_activity"("id");
ALTER TABLE
    "user_allergies" ADD CONSTRAINT "user_allergies_id_allergy_foreign" FOREIGN KEY("id_allergy") REFERENCES "allergies"("id");
ALTER TABLE
    "user_like_post" ADD CONSTRAINT "user_like_post_id_user_foreign" FOREIGN KEY("id_user") REFERENCES "users"("id");
ALTER TABLE
    "user_statistics" ADD CONSTRAINT "user_statistics_id_user_foreign" FOREIGN KEY("id_user") REFERENCES "users"("id");
ALTER TABLE
    "plans" ADD CONSTRAINT "plans_id_user_foreign" FOREIGN KEY("id_user") REFERENCES "users"("id");
ALTER TABLE
    "recipe_allergies" ADD CONSTRAINT "recipe_allergies_id_allergy_foreign" FOREIGN KEY("id_allergy") REFERENCES "allergies"("id");
ALTER TABLE
    "recipe_steps" ADD CONSTRAINT "recipe_steps_id_recipe_foreign" FOREIGN KEY("id_recipe") REFERENCES "recipes"("id");
ALTER TABLE
    "ingredients" ADD CONSTRAINT "ingredients_id_recipe_foreign" FOREIGN KEY("id_recipe") REFERENCES "recipes"("id");
ALTER TABLE
    "recipe_allergies" ADD CONSTRAINT "recipe_allergies_id_recipe_foreign" FOREIGN KEY("id_recipe") REFERENCES "recipes"("id");
ALTER TABLE
    "favorite_recipes" ADD CONSTRAINT "favorite_recipes_id_recipe_foreign" FOREIGN KEY("id_recipe") REFERENCES "recipes"("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_id_group_foreign" FOREIGN KEY("id_group") REFERENCES "groups"("id");
ALTER TABLE
    "post_comments" ADD CONSTRAINT "post_comments_id_post_foreign" FOREIGN KEY("id_post") REFERENCES "posts"("id");
ALTER TABLE
    "user_like_post" ADD CONSTRAINT "user_like_post_id_post_foreign" FOREIGN KEY("id_post") REFERENCES "posts"("id");
ALTER TABLE
    "diet_detail" ADD CONSTRAINT "diet_detail_id_recipe_foreign" FOREIGN KEY("id_recipe") REFERENCES "recipes"("id");
ALTER TABLE
    "diet_detail" ADD CONSTRAINT "diet_detail_id_food_foreign" FOREIGN KEY("id_food") REFERENCES "foods"("id");
ALTER TABLE
    "diet" ADD CONSTRAINT "diet_id_goal_foreign" FOREIGN KEY("id_goal") REFERENCES "goals"("id");
ALTER TABLE
    "diet_detail" ADD CONSTRAINT "diet_detail_id_diet_foreign" FOREIGN KEY("id_diet") REFERENCES "diet"("id");
ALTER TABLE
    "diet" ADD CONSTRAINT "diet_id_user_foreign" FOREIGN KEY("id_user") REFERENCES "users"("id");
ALTER TABLE
    "user_groups" ADD CONSTRAINT "user_groups_id_user_foreign" FOREIGN KEY("id_user") REFERENCES "users"("id");
ALTER TABLE
    "user_groups" ADD CONSTRAINT "user_groups_id_group_foreign" FOREIGN KEY("id_group") REFERENCES "groups"("id");
ALTER TABLE
    "exercises" ADD CONSTRAINT "exercises_id_level_foreign" FOREIGN KEY("id_level") REFERENCES "exercise_level"("id");
ALTER TABLE
    "exercises" ADD CONSTRAINT "exercises_id_goal_foreign" FOREIGN KEY("id_goal") REFERENCES "goals"("id");
ALTER TABLE
    "exercises" ADD CONSTRAINT "exercises_id_classification_foreign" FOREIGN KEY("id_classification") REFERENCES "exercise_classification"("id");


/*--------------------------------------add changes ----------------------*/

ALTER TABLE "users" ADD CONSTRAINT "users_unique_email" UNIQUE ("email");

ALTER TABLE "users" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE "personal_access_tokens" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "countries" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "physical_activity" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "allergies" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "user_allergies" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "recipes" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "ingredients" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "recipe_steps" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "recipe_allergies" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "favorite_recipes" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "groups" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "posts" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "post_comments" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "user_like_post" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "plans" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "user_statistics" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "foods" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "diet" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "diet_detail" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "user_groups" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "exercises" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "exercise_classification" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "exercise_level" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "goals" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY;
ALTER TABLE "ingredients" ALTER COLUMN "amount" TYPE VARCHAR(255);

/*----------------------data -------------------------------*/
INSERT INTO countries(code, country) VALUES ('BR', 'Brazil');
INSERT INTO countries(code, country) VALUES ('CL', 'Chile');
INSERT INTO countries(code, country) VALUES ('HN', 'Honduras');
INSERT INTO countries(code, country) VALUES ('MX', 'Mexico');
INSERT INTO countries(code, country) VALUES ('PE', 'Peru');
INSERT INTO countries(code, country) VALUES ('UY', 'Uruguay');

INSERT INTO goals(goal) VALUES ('Lose fat');
INSERT INTO goals(goal) VALUES ('Maintain weight');
INSERT INTO goals(goal) VALUES ('Body volume');
INSERT INTO goals(goal) VALUES ('Improve Feeding');

INSERT INTO physical_activity(activity) VALUES ('Light');
INSERT INTO physical_activity(activity) VALUES ('Moderate');
INSERT INTO physical_activity(activity) VALUES ('Heavy');

INSERT INTO allergies(allergy) VALUES ('Gluten');
INSERT INTO allergies(allergy) VALUES ('Dairy');
INSERT INTO allergies(allergy) VALUES ('Egg');
INSERT INTO allergies(allergy) VALUES ('Seafood');
INSERT INTO allergies(allergy) VALUES ('Fish');
INSERT INTO allergies(allergy) VALUES ('Nuts');
INSERT INTO allergies(allergy) VALUES ('Soy');

INSERT INTO foods(food) VALUES ('Breakfast');
INSERT INTO foods(food) VALUES ('A.M. Snack');
INSERT INTO foods(food) VALUES ('Lunch');
INSERT INTO foods(food) VALUES ('P.M. Snack');
INSERT INTO foods(food) VALUES ('Dinner');
/*------------------- data---------*/
INSERT INTO recipes(name,description,preparation_time,photo_path,proteins,fats,carbs,calories,rating,created_at,updated_at) VALUES ('Salmon Bowl','A quick trip in the microwave reheats the salmon and rice (youll love the accompanying ice cube trick)',5,'/imageRecipes/SalmonBowl.jpg',24,34,18,645,0,current_timestamp,current_timestamp);

INSERT INTO recipes(name,description,preparation_time,photo_path,proteins,fats,carbs,calories,rating,created_at,updated_at) VALUES ('Vegetarian Chickpea Sandwich Filling','Spread this chickpea sandwich filling on crusty whole grain rolls or pita bread and serve with lettuce and tomato.',5,'/imageRecipes/vegetarian1.jpg',35,34,13,545,0,current_timestamp,current_timestamp);

INSERT INTO recipes(name,description,preparation_time,photo_path,proteins,fats,carbs,calories,rating,created_at,updated_at) VALUES ('Lemon Chicken Orzo Soup','This lemon chicken orzo soup is inspired by Panera Breads version.',5,'/imageRecipes/soup.jpg',10,30,10,445,0,current_timestamp,current_timestamp);

INSERT INTO recipes(name,description,preparation_time,photo_path,proteins,fats,carbs,calories,rating,created_at,updated_at) VALUES ('Peach and pancetta salad','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus iaculis interdum orci. ',5,'/imageRecipes/salad.jpeg',12,33,17,345,0,current_timestamp,current_timestamp);

INSERT INTO recipes(name,description,preparation_time,photo_path,proteins,fats,carbs,calories,rating,created_at,updated_at) VALUES ('Salad with citrus sesame dressing','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus iaculis interdum orci, eu laoreet magna tempus nec. ',5,'/imageRecipes/summer-salad.jpeg',10,30,10,445,0,current_timestamp,current_timestamp);



INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (1,'cooked salmon, flaked','3 ounces');
INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (1,'cooked white rice','1 cup');
INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (1,'soy sauce','1 tablespoon');

INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (2,'cooked white rice','1 cup');
INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (2,'soy sauce','1 tablespoon');

INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (3,'orzo pasta','3 ounces');
INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (3,'cooked white rice','1 cup');
INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (3,'soy sauce','1 tablespoon');

INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (4,'apple cider vinegar','1/4 cup');
INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (4,'soy sauce','1 tablespoon');

INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (5,'nori sesame topping','1/3 cup');
INSERT INTO ingredients(id_recipe,ingredient,amount) VALUES (5,'soy sauce','1 tablespoon');


INSERT INTO recipe_steps(id_recipe,step,description) VALUES (1,1,'Use a fork to flake salmon onto a microwave-safe plate. Top with rice and place 1 ice cube on top');
INSERT INTO recipe_steps(id_recipe,step,description) VALUES (1,2,'Uncover and remove ice cube. Drizzle soy sauce, Sriracha and mayonnaise over the top and toss everything with a fork until well-combined.');
INSERT INTO recipe_steps(id_recipe,step,description) VALUES (1,3,'Garnish with torn pieces of nori, sliced avocado and kimchi.');

INSERT INTO recipe_steps(id_recipe,step,description) VALUES (2,1,'Uncover and remove ice cube. Drizzle soy sauce, Sriracha and mayonnaise over the top and toss everything with a fork until well-combined.');
INSERT INTO recipe_steps(id_recipe,step,description) VALUES (2,2,'Garnish with torn pieces of nori, sliced avocado and kimchi.');

INSERT INTO recipe_steps(id_recipe,step,description) VALUES (3,1,'Use a fork to flake salmon onto a microwave-safe plate. Top with rice and place 1 ice cube on top');
INSERT INTO recipe_steps(id_recipe,step,description) VALUES (3,2,'Uncover and remove ice cube. Drizzle soy sauce, Sriracha and mayonnaise over the top and toss everything with a fork until well-combined.');
INSERT INTO recipe_steps(id_recipe,step,description) VALUES (3,3,'Garnish with torn pieces of nori, sliced avocado and kimchi.');

INSERT INTO recipe_steps(id_recipe,step,description) VALUES (4,1,'Sed consequat orci nec leo ornare, non tincidunt quam mattis. In fermentum porta vehicula');
INSERT INTO recipe_steps(id_recipe,step,description) VALUES (4,2,'Sed consequat orci nec leo ornare, non tincidunt quam mattis. In fermentum porta vehicula');
INSERT INTO recipe_steps(id_recipe,step,description) VALUES (4,3,'Sed consequat orci nec leo ornare, non tincidunt quam mattis. In fermentum porta vehicula');

INSERT INTO recipe_steps(id_recipe,step,description) VALUES (5,1,'Sed consequat orci nec leo ornare, non tincidunt quam mattis. In fermentum porta vehicula');
INSERT INTO recipe_steps(id_recipe,step,description) VALUES (5,2,'Sed consequat orci nec leo ornare, non tincidunt quam mattis. In fermentum porta vehicula');
INSERT INTO recipe_steps(id_recipe,step,description) VALUES (5,3,'Sed consequat orci nec leo ornare, non tincidunt quam mattis. In fermentum porta vehicula');

	









