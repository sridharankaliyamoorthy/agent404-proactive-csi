# Changelog

All notable changes to ProActive CSI - Agent 404 will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.4.0] - 2025-11-23

### Improved
- **🎯 User-Friendly Responses** - Addressed project manager feedback on accessibility
  - **Abbreviation Explanations:** All abbreviations (ARR, C-001, etc.) now explained on first use
  - **Churn Risk Context:** Added clear explanations of what churn probability percentages mean
    - 0-30% (LOW): Normal business risk
    - 31-50% (MEDIUM): Increased attention needed
    - 51-70% (HIGH): Significant risk, immediate intervention required
    - 71-100% (CRITICAL): Urgent action needed
  - **Financial Impact Explanations:** ARR and revenue at risk now explained in plain language
  - **"What This Means" Sections:** Added contextual explanations throughout responses
  - **Reduced Cognitive Load:** Better formatting, hierarchy, and digestible information chunks
  - **Non-Expert Usability:** Responses now make users experts rather than assuming domain knowledge

### Changed
- **Response Format:** Updated all example responses to follow user-friendly guidelines
  - Priority briefing now includes explanations for all terms and percentages
  - High-risk customer reports include "What This Means" sections
  - Financial metrics explained in business impact terms
- **Agent Instructions:** Added comprehensive "User-Friendly Response Guidelines" section
  - Always explain abbreviations on first use
  - Always provide context for percentages
  - Always explain financial impact
  - Use "What This Means" sections
  - Break down complex information
  - Use visual hierarchy for easy scanning

### Documentation
- Updated agent configuration with user-friendly response examples
- Added guidance for making responses accessible to non-expert users
- Improved formatting and readability of all example responses

### Deployment
- **Successfully Deployed** - Agent updated on IBM watsonx Orchestrate with new user-friendly guidelines
- **Environment:** production-au (Australia Sydney)
- **Status:** Active and operational with improved accessibility

---
## [2.3.0] - 2025-11-23

### Security
- **🔒 Critical Security Fix** - Removed all hardcoded IBM Cloud credentials from codebase
  - All API keys now loaded securely from `.env` file (git-ignored)
  - Created `.env.example` template for safe credential management
  - Removed exposed credentials from:
    - `integrations/ibm_services.py` - All service initializations now use environment variables
    - `scripts/deployment/*.sh` - All deployment scripts now load from `.env`
    - `scripts/deployment/*.py` - Python scripts updated to use environment variables
  - Deleted `config/orchestrate_credentials.json` containing exposed keys
  - **⚠️ IMPORTANT:** Users must rotate their IBM Cloud API keys if they were previously exposed

### Changed
- **Environment Variable Support** - All services now require credentials via environment variables
  - `ORCHESTRATE_API_KEY` - IBM watsonx Orchestrate API key
  - `NATURAL_LANGUAGE_UNDERSTANDING_APIKEY` - NLU service API key
  - `SPEECH_TO_TEXT_APIKEY` - STT service API key
  - `TEXT_TO_SPEECH_APIKEY` - TTS service API key
  - `CLOUDANT_APIKEY` - Cloudant database API key
- **Docker Configuration** - Updated for secure credential injection
  - `docker/docker-compose.yml` now loads credentials from `../.env`
  - Simplified `docker/Dockerfile` for better maintainability
  - Removed hardcoded credential mounts from docker-compose

### Added
- **`.env` File Support** - Centralized credential management
  - Created `.env` file (git-ignored) for local development
  - Created `.env.example` template for documentation
- **python-dotenv** - Added to `requirements.txt` for environment variable loading

### Fixed
- **Deployment Scripts** - All scripts now securely load credentials
  - `scripts/deployment/deploy_with_new_key.sh` - Uses `.env` instead of hardcoded keys
  - `scripts/deployment/deploy_auto.sh` - Loads from environment
  - `scripts/deployment/deploy_auto_final.sh` - Secure credential loading
  - `scripts/deployment/deploy_now.sh` - Environment variable support
  - `scripts/deployment/deploy_to_ibm_portal.sh` - Secure credential handling
  - `scripts/deployment/auto_deploy_cli.py` - Environment variable fallback
  - `scripts/deployment/auto_deploy_to_ibm.py` - Removed hardcoded fallback

### Deployment
- **Successfully Deployed** - Agent updated on IBM watsonx Orchestrate using secure credentials
- **Environment:** production-au (Australia Sydney)
- **Status:** Active and operational

### Documentation
- Updated deployment guides to reference `.env` file usage
- Added security best practices documentation
- Clarified credential management procedures

---
## [2.2.0] - 2025-11-23

### Refactored
- **Project Structure Cleanup** - Major reorganization of the project codebase
  - Consolidated all documentation into `docs/` with subdirectories:
    - `docs/deployment/`: Deployment guides and status reports
    - `docs/guides/`: User guides and how-tos
    - `docs/features/`: Feature documentation (TTS, STT, etc.)
    - `docs/project_management/`: Project plans and summaries
    - `docs/troubleshooting/`: Fix guides and issue resolution
  - Moved configuration files to `config/` directory
  - Organized Docker files into `docker/` directory
  - Consolidated all scripts into `scripts/` with functional categories (`deployment`, `testing`)
  - Cleaned up root directory to only contain essential files (`app.py`, `README.md`, etc.)

### Added
- **Docker Organization** - dedicated folder for Docker artifacts
- **Script Management** - better separation of deployment and testing scripts

### Documentation
- Updated file paths in documentation to reflect new structure
- Centralized deployment status and guides

---
## [2.1.0] - 2025-11-22

### Added
- **Successful Deployment** - Deployed to IBM watsonx Orchestrate (AU-Sydney)
- **Version Upgrade** - Bumped to 2.1.0 to reflect production deployment status
- **Deployment Verification** - Added deployment proof and success reports

---
## [1.2.0] - 2025-01-XX

### Added
- **Audio STT & TTS Integration** - Complete IBM Watson Speech-to-Text and Text-to-Speech integration
- STT Integration Guide (`docs/testing/STT_INTEGRATION_GUIDE.md`)
  - Complete IBM Watson Speech-to-Text API documentation
  - POST /v1/recognize method documentation
  - Audio format support (FLAC, WAV, MP3, OGG)
  - Default model: en-US_BroadbandModel
  - Testing procedures and examples
- TTS Integration Guide (`docs/testing/TTS_INTEGRATION_GUIDE.md`)
  - Complete IBM Watson Text-to-Speech API documentation
  - POST /v1/synthesize and GET /v1/synthesize methods
  - Voice options: en-US_MichaelV3Voice, en-US_AllisonV3Voice
  - Audio format support (WAV, OGG, MP3, FLAC)
  - Text formatting best practices for voice synthesis
  - Testing procedures and examples
- STT/TTS Testing Guide (`docs/testing/STT_TTS_IBM_TESTING.md`)
  - Combined testing procedures for both services
  - Test queries for IBM watsonx Orchestrate
  - Expected response patterns
  - Verification checklist

### Enhanced
- **Agent Configuration (`proactive-csi-agent-orchestrate.yaml`)**:
  - Added detailed IBM Watson STT API integration instructions
  - Added detailed IBM Watson TTS API integration instructions
  - Enhanced voice-first capabilities documentation
  - Added API endpoint references (POST /v1/recognize, POST /v1/synthesize)
  - Added voice and format specifications in agent responses
  - Added text formatting guidelines for voice synthesis
  - Enhanced example responses with STT/TTS API details
  - Added hands-free voice workflow examples

### Changed
- Updated version to 1.2.0
- Enhanced agent instructions with complete STT/TTS integration details
- Improved voice response examples with API method references

### Technical Details - STT Integration
- **Service:** IBM Watson Speech-to-Text
- **API Endpoint:** POST /v1/recognize
- **Service URL:** https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>
- **Default Model:** en-US_BroadbandModel
- **Supported Formats:** audio/flac, audio/wav, audio/mp3, audio/ogg
- **Authentication:** IAM API Key

### Technical Details - TTS Integration
- **Service:** IBM Watson Text-to-Speech
- **API Endpoints:** POST /v1/synthesize, GET /v1/synthesize
- **Service URL:** https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/298e2b63-de83-427c-b77d-156c0976eed7
- **Default Voice:** en-US_MichaelV3Voice (Professional male)
- **Alternative Voice:** en-US_AllisonV3Voice (Professional female)
- **Output Formats:** audio/wav (recommended), audio/ogg (default), audio/mp3
- **Authentication:** IAM API Key

### Documentation
- Complete STT/TTS integration documentation
- API method references and examples
- cURL command examples for testing
- Response pattern documentation
- Troubleshooting guides

---
## [1.1.0] - 2025-01-XX

### Added
- Comprehensive project summary document (COMPREHENSIVE_PROJECT_SUMMARY.md)
- Complete project lifecycle documentation
- Detailed step-by-step development process
- All phases and milestones documented
- Lessons learned section
- Future enhancement roadmap

### Changed
- Updated version to 1.1.0
- Enhanced project documentation structure

### Documentation
- Created comprehensive project summary covering:
  - All development phases (11 phases)
  - Complete technology stack
  - All features implemented
  - Testing procedures
  - Deployment process
  - Business metrics
  - Project statistics

---

## [1.0.0] - 2025-01-XX

### Added
- Initial release of ProActive CSI Agent 404
- Multi-agent system architecture:
  - Customer Success Intelligence Agent
  - Procurement Intelligence Agent  
  - Revenue Protection Agent
- Integration with 6 IBM Cloud services:
  - watsonx.ai - Churn prediction and AI recommendations
  - watsonx Orchestrate - Multi-agent coordination
  - Natural Language Understanding (NLU) - Sentiment analysis
  - Speech-to-Text - Voice commands
  - Text-to-Speech - Voice responses
  - Cloudant - Data persistence and analytics
- 6 autonomous workflows:
  - Churn Prediction Workflow
  - Procurement Early-Warning Workflow
  - Customer Escalation Auto-Resolution
  - Contract Renewal Prep
  - Daily Executive Brief
  - Procurement-Customer Impact Bridge
- Streamlit local demo application
- Automated deployment scripts for IBM watsonx Orchestrate
- Comprehensive documentation:
  - Deployment guides (AU-Sydney region)
  - Testing guides and quick references
  - Demo scripts
  - API integration examples

### Fixed
- LLM configuration: Added watsonx/ provider prefix to fix provider validation error
- Revenue agent: Fixed date calculation issues in renewal pipeline analysis
- IBM services: Fixed Cloudant timestamp generation (os.time() → datetime.now())

### Changed
- Updated deployment configuration to Australia Sydney (AU) region
- Improved agent instructions and workflow descriptions
- Enhanced documentation structure and organization
- Refined agent response templates for better clarity

### Deployment
- Successfully deployed to IBM watsonx Orchestrate (AU-Sydney)
- Agent verified and tested with priority queries
- Status: Production Ready ✅

### Technical Details
- LLM Model: watsonx/meta-llama/llama-3-2-90b-vision-instruct
- Python Version: 3.8+
- Key Dependencies: ibm-watson, streamlit, pandas, pytest
- Deployment Method: IBM watsonx Orchestrate CLI

---

**Release Notes:**
- Agent is fully operational and responding correctly
- All core workflows implemented and tested
- Documentation complete and organized
- Ready for hackathon demonstration and production use

