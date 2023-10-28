# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [📊 Database Schema Diagram](#database-schema-diagram)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  <!-- - [🚀 Live Demo](#live-demo) -->
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Create database](#create-database)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 📖 Vet Clinic <a name="about-project"></a>

**Vet Clinic** is a project for creating the initial data structure for a veterinary clinic using a relational database. It implements PostgreSQL and contains all the data about animals.

### 📊 Database Schema Diagram <a name="database-schema-diagram"></a>
<!-- <div align="center">
  <img src="./database-schema-diagram.png" alt="database-schema-diagram" />
  <br/>
</div> -->

[Open in drawSQL](https://drawsql.app/teams/lucy-wanjiru/diagrams/veterinaryventures)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Create a database to store animals' information**
- **Insert some data into table**
- **Query table based on different conditions**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ## 🚀 Live Demo <a name="live-demo"></a>

- Deploying soon... -->
<!-- 
<p align="right">(<a href="#readme-top">back to top</a>)</p> -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- [PostgreSQL server](https://www.postgresql.org/download/) installed and running.
- [psql](https://www.postgresql.org/docs/current/app-psql.html) installed.

### Setup

Clone this repository to your desired folder:

```
git clone git@github.com:lucy-sees/VeterinaryVentures.git
cd VeterinaryVentures
```
### Create database

1. Connect to your PostgreSQL server with `psql`
```
> psql
postgres=#
```

2. Create the database `veterinary_ventures`
```
postgres=# CREATE DATABASE veterinary_ventures;
CREATE DATABASE
```

3. Connect to your database veterinary_ventures. Inside your current session do:
```
postgres=# \c veterinary_ventures
You are now connected to database "veterinary_ventures" as user "postgres".
veterinary_ventures=#
```

That's it! Congratulations, you have created your database and connected to it. Next, we will add a table.

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Lucy W. Mwangi**

- GitHub: [@lucy-sees](https://github.com/lucy-sees)
- Twitter: [@lucy_w_mwangi](https://twitter.com/lucy_w_mwangi)
- LinkedIn: [Lucy (Wanjiru) Mwangi](https://www.linkedin.com/in/lucy-wanjiru-mwangi)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Insert new data**
- [ ] **Update existence data**
- [ ] **Delete existence data**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/lucy-sees/VeterinaryVentures/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project, please consider giving it a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- I would like to thank all code reviewers for making this project better.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](https://github.com/lucy-sees/VeterinaryVentures/blob/b69b1e5aa3a6d1f3bd8c487d5325567a88badce2/LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
