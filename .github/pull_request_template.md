This template for pull requests on GitHub enables creating a smooth and efficient way of working with dbt for analytics.

A pull request (PR) is the final check to make sure nothing has been missed and all the business and logic requirements are in place on code or project. 
A template for pull requests also makes it easier and clearer for the reviewer to get an idea and overview of the changes before looking at the actual code and standardizes the whole process for working and reviewing code changes on dbt core.

### 🗒️ Description:
- <describe the feature or bug fix here>
> ### ⚠️ **Technical Debt**
> - <If applicable, add details and reasons here, otherwise - please remove this section>
> ### 🛄 **Piggyback Changes or Bug Fixes**
> - <If applicable, add details and reasons here, otherwise - please remove this section>
### 💡 **Dev Test Evidence:**
- <add details here>
- <attach screenshots (if applicable)>
- <attach SQL to reproduce tests (if applicable)>
### 📌 **Validation:**
1. [ ] I have followed all the steps outlined on **DBT Developer Checklist** guidelines (please see Ways of Working Guidance (Transformation))
2. [ ] If parts of the **Ways of Working Guidance** wasn't followed, I have added an explanation or reason-for-exemption below:
3. [ ] I have appropriately commented on the code. (**NOTE:** Comments should explain *why* the code does something a particular way, rather than what it does.)
4. [ ] I have run `dbt compile` after every commit
5. [ ] I have run `dbt run` (both backfill and incremental) in full after the final commit
6. [ ] I have run `dbt test` in full after the final commit
7. [ ] (If applicable) I have captured and logged any unrelated issues found during `dbt test`, either warning(s) or error(s)
8. [ ] (If applicable) I have made relevant changes to the **README.md** file.
This content needs to be copy pasted into a pull_request_template.md file in the dbt project and pushed to the main branch.
Description - usually should be filled with the details of additions and code changes that have been made as part of the particular PR. 
Dev Test evidence - should have all the relevant screenshots of evidence of dbt run , dbt test running successfully or as expected.
Validation - All the relevant validations checked.
