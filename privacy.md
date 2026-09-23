# Quorum Privacy Policy

**Effective date:** September 13, 2026

**Applies to:** Quorum for iOS, version 0.1.0, bundle `com.wsig.Quorum`

---

## In plain language

Quorum is a civic records reader. It does not have accounts, analytics, ads, or
tracking. The civic lane you pick, the jurisdictions and bodies you follow, the
topics you save, and the civic records it downloads stay on your device. If you
choose to connect live data by entering a Hamlet API key, the key is stored in the
iOS Keychain and is sent only to the API it belongs to; the developer of Quorum
receives nothing. Alerts are local notifications — there is no push server and no
device registration.

**The short version:**

- No account, no sign-in.
- No analytics, no advertising, no tracking.
- No third-party SDKs.
- Follows, topics, the chosen civic lane, and synced records are stored on your device.
- The optional API key lives in the Keychain, never in `UserDefaults` or source.
- Alerts are local notifications only. There is no server and no APNs.
- The default build runs on bundled sample data and makes no network request at all.

---

## What Quorum does

Quorum lets you follow local government bodies (a city council, a county
commission, a planning board), read their meetings and agendas, read a timestamped
transcript, save topics, and be told when one of those topics comes up. No account
or sign-in is required.

This first release ships with a small set of **bundled sample jurisdictions** so
every screen can be explored without credentials ("demo mode"). Live data is
optional and requires a Hamlet API key.

---

## Information we do NOT collect

Quorum does not collect, store on any server, or transmit to the developer:

- Personal information (name, email, phone number, address)
- Account credentials (there are no accounts)
- Analytics or usage data
- Advertising identifiers (IDFA / advertising IDs)
- Location data
- Contacts, photos, camera, or microphone data
- Health, motion, or fitness data
- Your follows, saved topics, or search queries
- Crash reports containing personal information

There is no developer-operated server that receives user data. The app contains no
analytics SDK and no advertising SDK.

---

## Data stored on your device

All of the following lives in the app's own container on your device. Deleting the
app deletes it.

- **Your civic lane** (the role you chose during onboarding) — stored in
  `UserDefaults`.
- **Followed jurisdictions and government bodies** — stored in `UserDefaults`.
- **Saved topics** — stored in `UserDefaults`, JSON-encoded.
- **Sync watermarks** (the timestamp used to fetch only new records) — stored in
  `UserDefaults`.
- **Alert bookkeeping** (which alerts were already shown, so they are not repeated) —
  stored in `UserDefaults`.
- **Civic records synced for offline use** (locations, bodies, meetings, agendas) —
  stored in a local SwiftData database.

None of this is sent to the developer.

---

## The optional Hamlet API key

Quorum works fully in demo mode with no key. If you enter a Hamlet API key in
Settings:

- The key is stored **only in the iOS Keychain**, as a generic password under the
  service `com.wsig.Quorum.hamlet`, account `hamlet-api-key`, with
  `kSecAttrAccessibleAfterFirstUnlock` so a background alert check can read it after
  the device has been unlocked once since boot.
- The key is sent as a bearer credential **only to `https://api.myhamlet.com`** —
  the API the key belongs to. It is never sent to the developer of Quorum.
- You can remove it at any time in Settings, which returns the app to demo mode.

---

## Network requests

In the **default demo mode — no stored key — Quorum makes no network request at
all.** The app selects its bundled fixture data source when no key is present.

If you configure a Hamlet API key, the app talks to `https://api.myhamlet.com` only:

- It lists locations, government bodies, meetings, and agendas, and downloads a
  timestamped transcript file from a time-limited (presigned) URL the API returns.
- Requests carry the API key as a bearer token and the identifiers of the records
  being requested.
- Standard HTTP information (such as your IP address, sent by iOS for any network
  request) reaches that third-party API. The developer of Quorum receives none of
  it. Hamlet's own privacy policy applies to the data Hamlet processes.

---

## Notifications

Alerts are delivered as **local notifications** using the iOS notification system.
There is no push notification server, no APNs registration, and no device token.
Quorum never asks for notification permission at launch; it asks once, in context,
after you finish onboarding.

You can turn notifications off at any time in iOS Settings → Notifications. Quorum's
Settings screen shows the current permission and links there.

---

## Background refresh

The app declares the iOS `fetch` background mode and registers a single background
task (`com.wsig.Quorum.refresh-alerts`) that runs a short, bounded local check for
new matches among the bodies you follow. It performs no server work beyond the
Hamlet API calls described above (and none at all in demo mode).

---

## Logging

Quorum writes diagnostic messages to the **local** Apple unified log (OSLog) — for
example, that a sync failed. These logs stay on the device and are not transmitted
to the developer.

---

## Third-party SDKs

Quorum bundles **no third-party SDKs**. It is built only with Apple frameworks:
SwiftUI, Foundation, SwiftData, UIKit, OSLog, Observation, Security,
UserNotifications, BackgroundTasks, and CoreGraphics. There are no analytics,
advertising, attribution, crash-reporting, or social SDKs to disclose.

---

## Data sharing

Quorum does not sell, rent, or share your data. There is no developer server to
share it with. The only outbound connection, when you opt into live data, is to the
Hamlet API belonging to the key you configured.

---

## TestFlight and the App Store (Apple)

If you install Quorum through TestFlight, Apple collects crash logs, device and OS
version, and any feedback you choose to submit. The developer may receive
TestFlight crash logs and feedback text (which can include device metadata such as
model and iOS version) solely to fix bugs. Apple's own privacy policy applies.

---

## Children's privacy

Quorum is a public-records reading tool with no social features, no messaging, and
no user-generated content. It does not knowingly collect personal information from
anyone, including children. Quorum is not directed at children.

---

## Data retention and deletion

- **On your device:** data persists until you delete it in the app or delete the app.
- **Developer servers:** none. There is no server-side copy to retain or delete.
- To remove the optional API key specifically, clear it in Settings.

---

## Data security

- Device data is protected by the iOS app sandbox and iOS file encryption.
- The optional API key is stored in the Keychain, never in plain `UserDefaults`, a
  plist, or source control.
- Network traffic to the Hamlet API, when enabled, uses HTTPS (TLS).

---

## Changes to this policy

If Quorum's data practices change, this document will be updated and the date at the
top revised. The App Store privacy answers and this policy are kept in sync.

---

## App Store privacy summary

| Question | Answer |
| --- | --- |
| Does this app collect data? | **No — "Data Not Collected."** |
| Is data used for tracking? | **No.** |
| Third-party SDKs requiring disclosure | **None.** |
| Required-reason APIs | **UserDefaults.** |
| Data linked to the user | **None.** |
| Data used for advertising | **None.** |

---

## Contact

Questions about this policy: **wjsigmon@me.com**

---

*This policy describes app behavior and makes no legal representation.*
