package models

type GitHubWebhook struct {
	Repository Repository `json:"repository"`
	HeadCommit Commit     `json:"head_commit"`
}

type Repository struct {
	FullName string `json:"full_name"`

	// ... other repository fields (omitted for brevity)
}

type Commit struct {
	ID      string     `json:"id"`
	Message string     `json:"message"`
	Author  CommitUser `json:"author"`
}

type CommitUser struct {
	Email    string `json:"email"`
	Username string `json:"username"`
}
