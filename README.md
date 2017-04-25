# Fractal Test
[![Build Status](https://travis-ci.org/laerciosb/fractal_test.svg?branch=master)](https://travis-ci.org/laerciosb/fractal_test)

[![Code Climate](https://codeclimate.com/github/laerciosb/fractal_test/badges/gpa.svg)](https://codeclimate.com/github/laerciosb/fractal_test)

[![Test Coverage](https://codeclimate.com/github/laerciosb/fractal_test/badges/coverage.svg)](https://codeclimate.com/github/laerciosb/fractal_test/coverage)

[![Issue Count](https://codeclimate.com/github/laerciosb/fractal_test/badges/issue_count.svg)](https://codeclimate.com/github/laerciosb/fractal_test)

Back-End Application for tests to Fractal Tecnologia.

---

### Requirements ###

* **[Ruby 2.3.3p222](https://www.ruby-lang.org/en/)**
* **[Rails 5.0.2](http://guides.rubyonrails.org/)**
* **[PostgreSQL 9.5.5](https://www.postgresql.org/)**
* **[Redis 3.2.8](https://redis.io/)**
* **[Elasticsearch 2.3.1](https://www.elastic.co/products/elasticsearch)**
* **[Bower 1.8.0](https://bower.io/)** - *For swagger-ui presentation*

### Installation ###

**Obs.: The following instructions were tested on Ubuntu 16.04 distribution.**
**Obs.: Make sure you are running elasticsearch and redis.**

1. After 'git clone' command, configure your `config/database.yml` and run the following commands to install dependencies:
  - user@user:~/path_to_cloned_folder$ **bundle install**
  - user@user:~/path_to_cloned_folder$ **rails db:create**
  - user@user:~/path_to_cloned_folder$ **rails db:migrate**
  - user@user:~/path_to_cloned_folder$ **rails db:seed**
  - user@user:~/path_to_cloned_folder$ **rails searchkick:reindex:all**
  - **Manually install the dependencies that may have not been installed by the above command.**

2. Start the server and access the browser
  - user@user:~/path_to_cloned_folder$ **rails server**

3. If you want to access swagger doc, run:
  - user@user:~/path_to_cloned_folder$ **bower install**
  - access in your browser: `http://localhost:3000/docs`

4. If you want to run rspec specs, type:
  - user@user:~/path_to_cloned_folder$ **rspec**

5. If you want to run sidekiq for jobs, type:
  - user@user:~/path_to_cloned_folder$ **sidekiq -C config/sidekiq.yml**

---

## API Routes ##

### Products ###
|   Action                                 | Method    | URL                                               
| -----------------------------------------|-----------|----------------------------------------------------- 
|   List products                          |  `GET`    | /v1/products
|   List products by name                  |  `GET`    | /v1/products?name=<product_name>
|   List products by category              |  `GET`    | /v1/products?category=<category_name>
|   Create product                         |  `POST`   | /v1/products
|   Read product                           |  `GET`    | /v1/products/:id
|   List products                          |  `GET`    | /v1/products/:id/categories
|   List products                          |  `GET`    | /v1/products/:id/supplier
|   List products                          |  `GET`    | /v1/products/:id/place
|   Update product                         |  `PUT`    | /v1/products/:id
|   Delete product                         |  `DELETE` | /v1/products/:id

---

## Contributors

> Laércio de Souza Bezerra ([laerciosb](https://github.com/laerciosb)) laerciosouza@gmail.com

---
