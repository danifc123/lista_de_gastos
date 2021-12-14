class Transferencia {
  final double valorGasto;
  final String horaedatatransacao;

  Transferencia(this.valorGasto, this.horaedatatransacao);

  @override
  String toString() {
    return 'Transferencia{valor: $valorGasto, horaedatatransacao: $horaedatatransacao}';
  }
}
