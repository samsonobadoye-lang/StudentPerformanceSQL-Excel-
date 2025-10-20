# StudentPerformanceSQL-Excel-
![School Dashboard Banner](https://media.istockphoto.com/id/539326423/photo/high-school-teacher-teaching-his-class-of-teenage-students-japan.jpg?s=612x612&w=0&k=20&c=IUTqrfwSQKCHssMjgzsY6IyZChZ95wPQvKmYYRWtdpU=)

# SQL-Based Student Performance Dashboard Project

###  **Author:** Obadoye Samson  
**Institution:** Babtech Computers Technology Center  
**Instructor:** Mr. Daniel Tofunmi  

---

## 📘 **Overview**

This project analyzes students’ academic performance data using **SQL** and **Excel**, transforming raw datasets into actionable insights and a visual dashboard.  
The goal is to understand patterns in student scores, attendance, and extracurricular participation — and to recommend strategies for improving overall performance.

---

## 🎯 **Objectives**

- Combine and analyze data from multiple tables using SQL joins.  
- Explore relationships between attendance, performance, and extracurricular involvement.  
- Identify key factors influencing academic outcomes.  
- Build an interactive Excel dashboard for better data storytelling.  
- Generate actionable recommendations for educators and administrators.  

---

## 🗂️ **Datasets Used**

| File Name | Description |
|------------|-------------|
| `students.csv` | Contains student demographic data |
| `scores.csv` | Records marks in English, Math, and Science |
| `attendance.csv` | Displays attendance percentages |
| `extracurricular.csv` | Tracks participation in various school activities |

All datasets were cleaned and integrated using **SQL** before visualization.

---

## ⚙️ **Data Preparation & Methodology**

1. **Data Cleaning:** Removed duplicates, handled missing values, standardized text.  
2. **Integration:** Linked all tables using the common `StudentID` key.  
3. **SQL Analysis:** Answered 28 business queries using joins, grouping, and aggregates.  
4. **Visualization:** Exported analyzed data to Excel and built an interactive dashboard using **Pivot Charts** and **Slicers**.  
5. **Validation:** Cross-checked results between SQL outputs and dashboard visuals.

---

## 📊 **Dashboard Overview**

### **Key Metrics**
- Total Students: **250**
- Average Math Score: **69.91**
- Average Science Score: **69.83**
- Average English Score: **69.82**
- Average Attendance: **80.16%**

### **Visuals & Features**
- Attendance by Gender (Pie Chart)  
- Attendance by Grade Level (Column Chart)  
- Scores by Grade Level (Clustered Chart)  
- Attendance vs Extracurricular Activities (Bar Chart)  
- Top Performing Students (Table View)  
- Interactive Slicers: *Gender*, *Grade Level*, *Study Group*, *Activity Type*

---

## 💡 **Key Insights**

- **Balanced Gender Representation:** Equal attendance between male and female students.  
- **Best Performing Grade:** Grade 11 students had the highest average performance.  
- **Attendance Correlation:** Higher attendance leads to better grades.  
- **Group Comparison:** Study Group B consistently outperformed others.  
- **Extracurricular Balance:** Students in Music and Sports showed good academic performance.  
- **Subject Relationship:** Math and Science scores are strongly correlated.  
- **Overall Stability:** Most students fall between 65–75% average range.  

---

## 🧠 **Strategic Recommendations**

- Reward students with attendance above **90%**.  
- Provide extra tutoring for weaker groups (especially Group A and Grade 12).  
- Continue promoting extracurricular engagement.  
- Use this dashboard monthly for tracking academic progress.  
- Involve parents in regular performance reviews.  
- Introduce peer mentorship programs.  
- Track teacher performance metrics in future analyses.  
- Maintain a live SQL database for continuous term-by-term updates.  

---

## 🧮 **Sample SQL Queries**

*Average Score by Subject**
`sql
SELECT subject, AVG(score) AS avg_score
FROM scores
GROUP BY subject;

## Attendance by Gender  #
SELECT gender, AVG(attendance_percent) AS avg_attendance
FROM attendance
JOIN students ON attendance.student_id = students.student_id
GROUP BY gender;

## Top 5 Performing Students #
SELECT s.student_name, AVG(sc.score) AS avg_score
FROM scores sc
JOIN students s ON s.student_id = sc.student_id
GROUP BY s.student_name
ORDER BY avg_score DESC
LIMIT 5;

## Conclusion

This project shows how SQL and Excel can work together to turn raw data into meaningful insights.
By leveraging SQL queries for analysis and Excel for visualization, it provides a clear, data-driven view of student performance that supports smarter academic decision-making.

## Acknowledgment

Special thanks to Mr. Daniel Tofunmi for his guidance and mentorship, and to Babtech Computers Technology Center for providing the tools and learning environment that made this project possible.

## How to Use This Repository

- Clone or download this repo.

- Open the SQL scripts in MySQL Workbench or any SQL IDE.

- Load the .csv files into your database.

- Run the queries to generate results.

- View or recreate the Excel dashboard for visualization.
