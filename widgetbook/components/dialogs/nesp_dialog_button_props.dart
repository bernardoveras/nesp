typedef VoidCallback = void Function();

class NespDialogButtonProps {
  final String label;
  final bool loading;
  final VoidCallback? onPressed;
  final bool closeOnTap;

  NespDialogButtonProps({
    required this.label,
    this.loading = false,
    this.onPressed,
    this.closeOnTap = true,
  });
}
