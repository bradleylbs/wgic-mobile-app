import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';
// import 'package:google_fonts/google_fonts.dart'; // Already in app_theme

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  final _formKey = GlobalKey<FormState>();

  Widget _buildAuthToggle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => setState(() => _isLogin = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _isLogin ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: _isLogin ? [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 5, offset: const Offset(0,2))
                  ] : [],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_isLogin) Image.asset('assets/images/logo.png', height: 16, width: 16),
                    if (_isLogin) const SizedBox(width: 8),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: _isLogin ? Colors.black : Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => setState(() => _isLogin = false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !_isLogin ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                   boxShadow: !_isLogin ? [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 5, offset: const Offset(0,2))
                  ] : [],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!_isLogin) Image.asset('assets/images/logo.png', height: 16, width: 16),
                    if (!_isLogin) const SizedBox(width: 8),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: !_isLogin ? Colors.black : Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0).copyWith(top:60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 96,
              height: 96,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                 boxShadow: [
                    BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 10, spreadRadius: 2),
                  ],
              ),
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 16),
            Text('WGIC', style: Theme.of(context).textTheme.displaySmall),
            Text('World Gospel Impact Church', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[300])),
            const SizedBox(height: 8),
            Text(
              _isLogin ? "Welcome back to your spiritual home" : "Join our church community",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
            ),
            _buildAuthToggle(),
            Card(
              elevation: 0,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Opacity(
                      opacity: 0.05,
                      child: Image.asset('assets/images/logo.png', height: 64, width: 64),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            _isLogin ? "Sign In to WGIC" : "Join WGIC Family",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _isLogin ? "Access your church community and spiritual resources" : "Create your account to connect",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 24),
                          if (!_isLogin) ...[
                            Row(
                              children: [
                                Expanded(child: TextFormField(decoration: const InputDecoration(hintText: 'First Name'))),
                                const SizedBox(width: 16),
                                Expanded(child: TextFormField(decoration: const InputDecoration(hintText: 'Last Name'))),
                              ],
                            ),
                            const SizedBox(height: 16),
                            TextFormField(decoration: const InputDecoration(hintText: 'Phone Number')),
                            const SizedBox(height: 16),
                          ],
                          TextFormField(
                            decoration: const InputDecoration(hintText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            decoration: const InputDecoration(hintText: 'Password'),
                            obscureText: true,
                          ),
                          if (!_isLogin) ...[
                            const SizedBox(height: 16),
                            TextFormField(decoration: const InputDecoration(hintText: 'Confirm Password'), obscureText: true),
                          ],
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              screenProvider.setCurrentScreen(AppScreen.home);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/logo.png', height: 20, width: 20),
                                const SizedBox(width: 8),
                                Text(_isLogin ? 'Sign In to WGIC' : 'Join WGIC'),
                              ],
                            ),
                          ),
                          if (_isLogin)
                            TextButton(
                              onPressed: () {},
                              child: const Text('Forgot Password?'),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey[700])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                       Image.asset('assets/images/logo.png', height: 16, width: 16, color: Colors.grey[600]),
                       const SizedBox(width: 4),
                      Text('Or continue with', style: Theme.of(context).textTheme.bodySmall),
                       const SizedBox(width: 4),
                       Image.asset('assets/images/logo.png', height: 16, width: 16, color: Colors.grey[600]),
                    ],
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey[700])),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.g_mobiledata, size: 20), label: const Text('Google'))), // Placeholder for Google icon
                const SizedBox(width: 16),
                Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.facebook, size: 20), label: const Text('Facebook'))),
              ],
            ),
            const SizedBox(height: 32),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 14, width: 14, color: Colors.grey[700]),
                const SizedBox(width: 4),
                Text('61 Borough Road, Wiggins, Durban', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
                const SizedBox(width: 4),
                Image.asset('assets/images/logo.png', height: 14, width: 14, color: Colors.grey[700]),
              ],
            ),
            const SizedBox(height: 4),
            Text('© 2025 World Gospel Impact Church', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700], fontSize: 10)),
          ],
        ),
      ),
    );
  }
}