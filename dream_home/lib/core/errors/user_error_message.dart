String getFriendlyErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'invalid-credential':
      return 'The credentials provided are invalid. Please try again.';
    case 'user-disabled':
      return 'Your account has been disabled. Please contact support.';
    case 'user-not-found':
      return 'No user found with this email. Please sign up.';
    case 'wrong-password':
      return 'The password is incorrect. Please try again.';
    case 'email-already-in-use':
      return 'This email is already in use. Please use a different email.';
    case 'operation-not-allowed':
      return 'This operation is not allowed. Please contact support.';
    case 'network-request-failed':
      return 'Network error. Please check your internet connection.';
    default:
      return 'An unexpected error occurred. Please try again.';
  }
}
