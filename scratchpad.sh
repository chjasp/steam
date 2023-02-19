gcloud run services describe my-service \
--platform=managed --region=us-central1 \
--format="table(metadata.annotations.iam\.gke\.io/*[] \
           .serviceAccountName,metadata.annotations.iam\.gke\.io/*[] \
           .serviceAccountEmail, \
         header='Service Account Name,Service Account Email')"
