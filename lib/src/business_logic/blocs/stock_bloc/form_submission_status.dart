abstract class FormSubmission {}

class FormSubmitting extends FormSubmission {}

class FormSubmitted extends FormSubmission {}

class SubmissionFailed extends FormSubmission {
  final Exception exception;
  SubmissionFailed(this.exception);
}
