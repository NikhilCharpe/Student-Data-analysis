# Student-Data-analysis
📊 Students Performance Analysis Project
📝 Overview
Students Performance Analysis Project is a data-driven initiative focused on analyzing student achievement data from a diverse school population. The project leverages a dataset containing demographic information, parental education, lunch status, test preparation, and scores across three subjects. The aim is to uncover insights into the factors influencing academic performance and to visualize key trends using Python, Statistical methods and SQL - based data analysis and visualization tools.

📂 Project Structure
StudentsPerformanceAnalysis/
│── 📂 DATA                                    # Contains .csv files of dataset
    │── 📄 StudentsPerformance.csv             # Dataset of student performance
    │── 📄 StudentsPerformance_processed.csv   # Cleaned dataset of student performance
│── 📂 TABLE                                   # Contains tables from sql
│── 📂 VISUALIZATIONS                          # Contains images of graphs & charts
    │── 📂 EDA                                 # Contains graphs derived from eda
    │── 📂 STATS                               # Contains graphs derived from statistical analysis 
│── 📄 README.md                               # Project documentation
│── 📄 Insights.md                             # Extracted insights from data analysis
│── 🖼️ ER Diagram.png                          # ER diagram illustrates database model
│── 📄 std-prfm-clean.ipynb                    # Jupyter Notebook for Data Cleaning
│── 📄 std-prfm-eda.ipynb                      # Jupyter Notebook for EDA & Visualization
│── 📄 std-prfm-sql.sql                        # SQL scripts for querying insights
│── 📄 std-prfm-stats.ipynb                    # Jupyter Notebook for Statistical Analysis
│── 📂 PRESENTATION                            # Project presentation slides (.pdf)
💻 Technologies Used
Python: Data cleaning, exploratory data analysis (EDA), visualization, and statistical analysis. Libraries used include Pandas, NumPy, Matplotlib, Seaborn, SciPy, and StatsModels.
SQL: Data querying and extraction using MySQL to gain insights from the structured data.
Jupyter Notebook: Interactive environment for documenting and executing Python code.
🗃️ Dataset Description
The project uses StudentsPerformance.csv, which includes the following columns:

👩‍🎓 gender: Gender of the student
🌍 race/ethnicity: Student's racial or ethnic group
🎓 parental_level_of_education: Highest education level of parents
🍽️ lunch: Lunch type (standard or free/reduced)
📚 test_preparation_course: Completion status of a test prep course
➗ math_score: Math test score
📖 reading_score: Reading test score
✍️ writing_score: Writing test score
After processing data, created a new csv file StudentsPerformance_processed.csv, in which new columns are added:

🆔 student_id: Unique identifier for each student
🏆 total_score: Aggregate score across all subjects
📈 percentage: Percentage score
🛠️ Data Processing & Cleaning
The raw data is checked cleaned for missing or inconsistent values.
Data types are standardized and irrelevant columns are removed and some new required columns derived from old data are added.
The processed dataset is ready for querying and visualization.
📊 Exploratory Data Analysis (EDA)
Using Pandas, Matplotlib, and Seaborn, the project explores:

Distribution of scores across subjects and demographics
Impact of parental education and lunch status on performance
Effectiveness of test preparation courses
Correlation between gender, ethnicity, and academic achievement
Visualization of top and bottom performers
🗃️ SQL Analysis
Performs SQL queries to extract specific insights from the data.
Analyzes the impact of factors like parental education and test preparation courses on student performance.
Identifies high-performing students and underperforming students based on specific criteria.
📈 Statistical Analysis
Conducts statistical tests (e.g., t-tests, Chi-Square, ANOVA) to determine the significance of observed differences in performance.
Builds models to identify key predictors of student success.
Provides recommendations based on statistical findings to improve student outcomes.
📌 Key Features
✔️ Cleaned and well-structured student performance dataset
✔️ Automated data processing and cleaning
✔️ Insightful visualizations for trends and patterns
✔️ Modular and maintainable codebase

🔧 Installation & Setup
Clone the repository:
git clone https://github.com/yourusername/StudentsPerformanceAnalysis.git
cd StudentsPerformanceAnalysis
Install the required Python libraries:

pip install pandas numpy matplotlib seaborn scipy statsmodels jupyter
Set up your MySQL database:

Create a database named StudentPerformance.
Import the data from StudentsPerformance.csv or StudentsPerformance_processed.csv into the database.
Ensure your connection details are correctly configured in the SQL scripts.
Run the Jupyter Notebooks:

Open and run std-prfm-clean.ipynb to clean and process the data.
Open and run std-prfm-eda.ipynb to perform exploratory data analysis.
Execute the SQL queries in std-prfm-sql.sql against your MySQL database.
Open and run std-prfm-stats.ipynb for statistical analysis.
🚀 Key Findings
Parental level of education significantly impacts student performance, with students whose parents have higher education levels generally scoring better.
Completion of a test preparation course is associated with higher scores in all subjects.
There are performance differences across racial/ethnic groups, indicating potential disparities.
Socioeconomic factors, as indicated by lunch type, also play a role in student achievement.
🚀 Future Improvements
Add interactive dashboards for real-time data exploration 📊
Integrate advanced statistical and machine learning models for predictive analysis 🤖
Expand dataset with additional features (attendance, extracurriculars, etc.) 📚
Develop a web interface for broader accessibility 🌐
📜 License
This project is open-source and available for modification and distribution.

📩 Contributions & Feedback
Contributions, suggestions, and feedback are welcome!
Feel free to fork the repository, submit issues, or open pull requests.

Happy Analyzing! 🚀
