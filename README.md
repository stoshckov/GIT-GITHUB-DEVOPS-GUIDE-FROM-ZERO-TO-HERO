# Perl Ops Toolchain v3.0

A professional-grade system monitoring and reporting suite built in Perl.

## 🚀 Features
- **Parallel Scanning**: Uses process forking for multi-threaded network checks.
- **DBI Persistence**: Stores scan history in a local SQLite database.
- **Live Reporting**: Integrated Webhook support for real-time alerts.
- **Safety First**: Protected by Git Hooks and Perl Taint Mode.

## 🛠 Installation
\`\`\`bash
git clone git@github.com:stoshckov/perl-ops-tool.git
cd perl-ops-tool
chmod +x *.pl
\`\`\`

## 📈 Usage
\`\`\`bash
./perl_ops_course.pl --host google.com --port 443
./reporter.pl --summary
\`\`\`
