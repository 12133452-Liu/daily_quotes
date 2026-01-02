import 'package:flutter/material.dart';
import 'quote_service.dart';

class AddQuotePage extends StatefulWidget {
  const AddQuotePage({super.key});

  @override
  State<AddQuotePage> createState() => _AddQuotePageState();
}

class _AddQuotePageState extends State<AddQuotePage> {
  final quoteCtrl = TextEditingController();
  final authorCtrl = TextEditingController();
  String msg = "";
  bool loading = false;

  Future<void> save() async {
    final q = quoteCtrl.text.trim();
    final a = authorCtrl.text.trim();

    if (q.isEmpty) {
      setState(() => msg = "Please enter a quote.");
      return;
    }

    setState(() {
      loading = true;
      msg = "";
    });

    try {
      await QuoteService.addQuote(q, a);
      setState(() => msg = "Saved ✅");
      quoteCtrl.clear();
      authorCtrl.clear();
    } catch (e) {
      setState(() => msg = e.toString());
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  void dispose() {
    quoteCtrl.dispose();
    authorCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Quote")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: quoteCtrl,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Quote",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: authorCtrl,
              decoration: const InputDecoration(
                labelText: "Author (optional)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loading ? null : save,
              child: Text(loading ? "Saving..." : "Save Quote"),
            ),
            const SizedBox(height: 12),
            Text(msg),
          ],
        ),
      ),
    );
  }
}