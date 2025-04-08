Welcome to your new dbt project!

## Setup
Make sure you have Python Install in your computer
* You should see two files called `.env_template` and `profiles_template.yml`. Be sure to rename them as `.env` and `profiles.yml`. The `.env` file will contain two environment variables, `DBT_USER` and `DBT_PASSWORD` wich will be used to connect to Snowflake. The `profiles.yml` will have your connection specifications.
* We need to create a Python environment in order to run dbt. To create the environment, run `python -m venv dbt-env`, this should create a folder with the configurations of the project. After this, to use the environment, run `source dbt-env/bin/activate`.
* Once using the virtual environment, run `pip install dbt-snowflake` to install dbt for Snowflake.
* If you have configured your `profiles.yml` correctly, run the `.env` variables in the command line, and then run `dbt debug`. You should get the following result
![Checks passed img|250](/docs/checks_passed.png)
* Lastly, run `dbt deps` to install the dependencies, `dbt seed` and then `dbt build`. You should be abble to execute this commands without any problem.

And that's it, you're all set!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
# consulting_dbt_capstone
