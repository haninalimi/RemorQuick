import 'package:flutter/material.dart';
import 'package:remorquage/utils/constants/colors.dart';

class CancellationReasonScreen extends StatefulWidget {
  const CancellationReasonScreen({Key? key}) : super(key: key);

  @override
  State<CancellationReasonScreen> createState() =>
      _CancellationReasonScreenState();
}

class _CancellationReasonScreenState extends State<CancellationReasonScreen> {
  final List<String> reasons = [
    "Waiting time is too long",
    "Price is too high",
    "Wrong location entered",
    "I contacted another service",
    "Issue resolved on my own",
  ];

  final TextEditingController _otherReasonController = TextEditingController();
  final FocusNode _otherFocusNode = FocusNode();
  bool _isOtherSelected = false;
  List<bool> _selectedReasons = [];
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _selectedReasons = List.generate(reasons.length, (_) => false);
    _otherFocusNode.addListener(_handleOtherFocusChange);
  }

  void _handleOtherFocusChange() {
    setState(() {
      _isOtherSelected =
          _otherFocusNode.hasFocus || _otherReasonController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _otherReasonController.dispose();
    _otherFocusNode.removeListener(_handleOtherFocusChange);
    _otherFocusNode.dispose();
    super.dispose();
  }

  void _submitReasons() {
    if (!_hasSelectedReason()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one reason')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final selected = <String>[];
    for (int i = 0; i < reasons.length; i++) {
      if (_selectedReasons[i]) selected.add(reasons[i]);
    }
    if (_otherReasonController.text.isNotEmpty) {
      selected.add(_otherReasonController.text);
    }

    // Simulate API call
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _isSubmitting = false);
        Navigator.pop(context, selected);
      }
    });
  }

  bool _hasSelectedReason() {
    return _selectedReasons.contains(true) ||
        _otherReasonController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cancel Towing",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Please select the reason for cancellation',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Liste des raisons
            Expanded(
              child: ListView(
                children: [
                  // Options prédéfinies
                  ...List.generate(reasons.length, (index) {
                    return _buildReasonOption(index);
                  }),

                  // Option "Other"
                  _buildOtherReasonField(),
                ],
              ),
            ),

            // Bouton Submit
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitReasons,
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child:
                    _isSubmitting
                        ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                        : const Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonOption(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            _selectedReasons[index] = !_selectedReasons[index];
            if (_selectedReasons[index]) {
              _otherReasonController.clear();
              _otherFocusNode.unfocus();
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  _selectedReasons[index]
                      ? TColors.primary
                      : Colors.grey.shade300,
              width: _selectedReasons[index] ? 1.5 : 1,
            ),
            boxShadow: [
              if (_selectedReasons[index])
                BoxShadow(
                  color: TColors.primary.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        _selectedReasons[index]
                            ? TColors.primary
                            : Colors.grey.shade400,
                    width: 1.5,
                  ),
                ),
                child:
                    _selectedReasons[index]
                        ? Icon(Icons.check, size: 16, color: TColors.primary)
                        : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  reasons[index],
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[800],
                    fontWeight:
                        _selectedReasons[index]
                            ? FontWeight.w500
                            : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtherReasonField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    _isOtherSelected ? TColors.primary : Colors.grey.shade300,
                width: _isOtherSelected ? 1.5 : 1,
              ),
              boxShadow: [
                if (_isOtherSelected)
                  BoxShadow(
                    color: TColors.primary.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: TextField(
              focusNode: _otherFocusNode,
              controller: _otherReasonController,
              maxLines: 3,
              minLines: 1,
              onChanged: (value) {
                setState(() {
                  _isOtherSelected =
                      value.isNotEmpty || _otherFocusNode.hasFocus;
                  if (_isOtherSelected) {
                    for (var i = 0; i < _selectedReasons.length; i++) {
                      _selectedReasons[i] = false;
                    }
                  }
                });
              },
              decoration: InputDecoration(
                hintText: 'Other reason (please specify)...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ), // Bordure blanche
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ), // Bordure blanche
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ), // Bordure blanche
                ),
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(color: Colors.grey[800], fontSize: 15),
            ),
          ),
          if (_isOtherSelected)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Please provide details',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
