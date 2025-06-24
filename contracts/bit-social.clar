;; Title: BitSocial - Sovereign Social Protocol
;;
;; Summary: Enterprise-grade decentralized social networking infrastructure
;;          built on Bitcoin's security foundation via Stacks Layer 2,
;;          delivering uncompromising privacy, scalable performance, and
;;          institutional-level compliance for the next generation of
;;          social interactions.
;;
;; Description: BitSocial represents a paradigm shift in social networking,
;;              combining Bitcoin's immutable security with Stacks' smart
;;              contract capabilities to create a truly decentralized social
;;              ecosystem. Features include military-grade encryption,
;;              intelligent batch processing for optimal performance,
;;              sophisticated rate limiting to prevent abuse, and granular
;;              privacy controls that put users in complete control of their
;;              digital identity. Built for enterprises, communities, and
;;              individuals who demand sovereignty over their social data
;;              while maintaining seamless user experiences.
;;

;; ERROR CONSTANTS - Comprehensive Error Handling System

(define-constant ERR_NOT_FOUND (err u100))
(define-constant ERR_ALREADY_EXISTS (err u101))
(define-constant ERR_UNAUTHORIZED (err u102))
(define-constant ERR_INVALID_INPUT (err u103))
(define-constant ERR_BLOCKED (err u104))
(define-constant ERR_DEACTIVATED (err u105))
(define-constant ERR_RATE_LIMITED (err u106))
(define-constant ERR_BATCH_FULL (err u107))
(define-constant ERR_BATCH_EXPIRED (err u108))

;; USER STATUS CONSTANTS - Account Lifecycle Management

(define-constant STATUS_DEACTIVATED u0)
(define-constant STATUS_ACTIVE u1)
(define-constant STATUS_SUSPENDED u2)

;; RELATIONSHIP CONSTANTS - Social Connection States

(define-constant FRIENDSHIP_PENDING u0)
(define-constant FRIENDSHIP_ACTIVE u1)
(define-constant FRIENDSHIP_BLOCKED u2)

;; RATE LIMITING CONSTANTS - Anti-Spam & Performance Protection

(define-constant MAX_ACTIONS_PER_DAY u100)
(define-constant MAX_FRIEND_REQUESTS_PER_DAY u20)
(define-constant MAX_STATUS_UPDATES_PER_DAY u24)
(define-constant RATE_LIMIT_RESET_PERIOD u86400) ;; 24 hours in seconds

;; BATCH PROCESSING CONSTANTS - High-Performance Operations

(define-constant MIN_BATCH_SIZE u10)
(define-constant MAX_BATCH_SIZE u100)
(define-constant BATCH_EXPIRY_PERIOD u3600) ;; 1 hour in seconds

;; CORE DATA STRUCTURES - Application State Management

;; Primary user registry with comprehensive profile data
(define-map Users
  principal
  {
    name: (string-ascii 64),
    status: uint,
    timestamp: uint,
    metadata: (optional (string-utf8 256)),
    deactivation-time: (optional uint),
    encryption-key: (optional (buff 32)),
    profile-image: (optional (string-utf8 256)),
  }
)

;; Advanced privacy control matrix for user data visibility
(define-map UserPrivacy
  principal
  {
    friend-list-visible: bool,
    status-visible: bool,
    metadata-visible: bool,
    last-seen-visible: bool,
    profile-image-visible: bool,
    encryption-enabled: bool,
    last-updated: uint,
  }
)

;; Intelligent rate limiting system for platform stability
(define-map RateLimits
  principal
  {
    daily-actions: uint,
    friend-requests: uint,
    status-updates: uint,
    last-reset: uint,
  }
)