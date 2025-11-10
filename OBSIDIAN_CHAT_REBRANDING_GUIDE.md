# ObsidianChat UI Rebranding Guide

This document provides step-by-step instructions for rebranding the better-chatbot application to ObsidianChat. These changes have been successfully implemented and tested.

---

## Table of Contents

1. [Overview](#overview)
2. [Scope & Constraints](#scope--constraints)
3. [Prerequisites](#prerequisites)
4. [Step-by-Step Implementation](#step-by-step-implementation)
5. [System Prompt Location](#system-prompt-location)
6. [Testing Checklist](#testing-checklist)
7. [Files Changed Summary](#files-changed-summary)

---

## Overview

### Branding Changes
- **Old Brand:** better-chatbot
- **New Brand:** ObsidianChat

### Terminology Mapping

| Old Term | New Term |
|----------|----------|
| better-chatbot | ObsidianChat |
| MCP Configuration | Extensions Settings |
| MCP Servers / My MCP Servers | Extensions / My Extensions |
| Generate Image | Image Generation |
| Workflow | ObsidianFlow |
| Agent | ObsidianShadow |
| Agents | Shadows |
| "What are you working on today, {name}?" | "What can ObsidianAI+ do for you?" |
| "Ask anything or @mention" | "What can ObsidianAI+ do for you?" |

---

## Scope & Constraints

### ✅ In Scope
- UI labels, placeholders, and static copy
- Translation file updates (en.json)
- Authentication page branding
- Hardcoded brand name replacements
- Static PNG for landing page background

### 🚫 Out of Scope (DO NOT CHANGE)
- Route paths (keep /mcp, /agent, /workflow, etc.)
- Environment variable keys
- API endpoints
- Backend logic
- Data models
- Database schemas
- Prompt/agent generation logic (except default names)

---

## Prerequisites

### Required Asset
You need to create/obtain an **ObsidianChat branding image**:
- **Filename:** `obsidian-chat.png`
- **Purpose:** Full background for authentication panel (50% left side of screen)
- **Recommended specs:**
  - Dimensions: Design should work at various aspect ratios (panel is responsive)
  - Format: PNG with or without transparency
  - Design consideration: Text overlay at bottom ("Welcome to ObsidianChat...")
  - Suggested dark overlay: The implementation includes a 20% black overlay for text readability

---

## Step-by-Step Implementation

### Step 1: Create Centralized UI Copy Dictionary

**Create new file:** `src/lib/uiCopy.ts`

```typescript
/**
 * Centralized UI copy for ObsidianChat branding
 * This file provides consistent terminology across the application
 */
export const uiCopy = {
  brand: "ObsidianChat",
  brandDescription: "Sign in to ObsidianChat",
  mcpLabel: "Extensions",
  mcpConfiguration: "Extensions Settings",
  agentsSingular: "ObsidianShadow",
  agentsPlural: "Shadows",
  workflow: "ObsidianFlow",
  imageAction: "Image Generation",
  composerPlaceholder: "What can ObsidianAI+ do for you?",
} as const;
```

---

### Step 2: Update Translation Files

**File:** `messages/en.json`

Apply the following edits to the English translation file:

#### 2.1: Workflow Section
```json
"Workflow": {
  "title": "ObsidianFlow",
  "whatIsWorkflow": "What is an ObsidianFlow?",
  "myWorkflows": "My ObsidianFlows",
  "sharedWorkflows": "Shared ObsidianFlows",
  "availableWorkflows": "Available ObsidianFlows",
  "noAvailableWorkflows": "No ObsidianFlows available",
  "createWorkflow": "Create ObsidianFlow",
  "createWorkflowDescription": "Create ObsidianFlows as powerful tools for your chatbot.",
  "noTools": "No published ObsidianFlows available.\nCreate ObsidianFlows to build custom tools.",
  // ... rest remains unchanged
}
```

#### 2.2: Auth Section
```json
"Auth": {
  "SignIn": {
    "title": "ObsidianChat",
    "description": "Sign in to ObsidianChat",
    // ... rest remains unchanged
  },
  "Intro": {
    "description": "Welcome to ObsidianChat. Sign in to experience our AI-powered conversational tools."
  }
}
```

#### 2.3: Chat Section
```json
"Chat": {
  "uploadImage": "Upload File",
  "generateImage": "Image Generation",
  "Greeting": {
    "whatAreYouWorkingOnToday": "What can ObsidianAI+ do for you?",
    // ... other greetings remain unchanged
  },
  "placeholder": "What can ObsidianAI+ do for you?",
  // ... rest remains unchanged
}
```

#### 2.4: Layout Section
```json
"Layout": {
  "workflow": "ObsidianFlow",
  "mcpConfiguration": "Extensions Settings",
  "agents": "Shadows",
  "newAgent": "Create ObsidianShadow",
  "createAgent": "Create an ObsidianShadow",
  "createYourOwnAgentOrSelectShared": "Create your own specialized ObsidianShadow or select from shared agents in the Shadows page",
  "availableAgents": "Available Shadows",
  "noAgentsAvailable": "No Shadows Available",
  "browseAgentsToBookmark": "Browse available shadows to bookmark your favorites",
  "askAdminToShareAgents": "No shadows available yet. Ask your admin to share shadows with you",
  "whatIsAgent": "What is ObsidianShadow?",
  // ... rest remains unchanged
}
```

#### 2.5: Agent Section
```json
"Agent": {
  "title": "ObsidianShadow",
  "newAgent": "Create ObsidianShadow",
  "generatingAgent": "Generating ObsidianShadow...",
  "agentNameAndIconLabel": "Give your ObsidianShadow a name and icon.",
  "agentDescriptionLabel": "Add a brief description of what this ObsidianShadow does.",
  "agentDescriptionPlaceholder": "This is just a description of the ObsidianShadow, it's not critical.",
  "agentSettingsDescription": "From here, these are settings that can affect the ObsidianShadow.",
  "thisAgentIs": "This ObsidianShadow is an expert in",
  "agentInstructionsLabel": "Feel free to write the ObsidianShadow's role, personality, guidelines, knowledge, etc.",
  "agentInstructionsPlaceholder": "This ObsidianShadow helps with stock analysis. It uses web search tools to obtain stock information...",
  "agentToolsLabel": "Add tools that this ObsidianShadow can use.",
  "generateAgentGreeting": "Hello! I'll help you create your own ObsidianShadow. What would you like to create?",
  "generateAgentDetailedGreeting": "Hello! I'll help you create your own ObsidianShadow. What would you like to create? You can write briefly or in detail.",
  "myAgents": "My Shadows",
  "bookmarkedAgents": "Bookmarked Shadows",
  "sharedAgents": "Shared Shadows",
  "availableAgents": "Available Shadows",
  "noAgents": "No shadows yet",
  "createFirst": "Create your first ObsidianShadow to get started",
  "noSharedAgents": "No shared shadows",
  "noSharedAgentsDescription": "No public shadows are available to bookmark",
  "noAvailableAgents": "No available shadows",
  "noAvailableAgentsDescription": "Ask your admin to share shadows with you",
  "bookmarkAdded": "ObsidianShadow bookmarked",
  "bookmarkedAgent": "Bookmarked ObsidianShadow",
  "addBookmark": "Bookmark ObsidianShadow",
  "deleted": "ObsidianShadow deleted",
  "created": "ObsidianShadow created successfully",
  "updated": "ObsidianShadow updated successfully",
  "deleteConfirm": "Are you sure you want to delete this ObsidianShadow?",
  "privateDescription": "Only you can view, edit, and use this ObsidianShadow.",
  "publicDescription": "Anyone can view, edit, and use this ObsidianShadow as a tool.",
  // ... rest remains unchanged
}
```

#### 2.6: MCP Section
```json
"MCP": {
  "marketplace": "Marketplace",
  "addMcpServer": "Add Custom Extension",
  "configureYourMcpServerConnectionSettings": "Configure your extension connection settings",
  "mcpConfiguration": "Extensions Settings",
  "mcpServers": "Extensions",
  "availableMcpServers": "Available Extensions",
  "noMcpServersAvailable": "No Extensions Available",
  "noMcpServersAvailableDescription": "Ask your admin to configure extensions for you to use",
  "myMcpServers": "My Extensions",
  "featuredMcpServers": "Featured Extensions",
  "overviewTitle": "Connect Your First Extension",
  "overviewDescription": "Add extensions to unlock powerful AI integrations",
  "privateDescription": "Only you can use this extension",
  "readonlyDescription": "Others can view but not modify this extension",
  // ... rest remains unchanged
}
```

---

### Step 3: Update App Metadata

**File:** `src/app/layout.tsx`

**Find:**
```typescript
export const metadata: Metadata = {
  title: "better-chatbot",
  description:
    "Better Chatbot is a chatbot that uses the Tools to answer questions.",
};
```

**Replace with:**
```typescript
export const metadata: Metadata = {
  title: "ObsidianChat",
  description:
    "ObsidianChat is an AI-powered chatbot that uses tools to answer questions.",
};
```

---

### Step 4: Update Authentication Layout

**File:** `src/app/(auth)/layout.tsx`

**Replace entire file contents with:**

```typescript
import { getTranslations } from "next-intl/server";
import { FlipWords } from "ui/flip-words";

export default async function AuthLayout({
  children,
}: { children: React.ReactNode }) {
  const t = await getTranslations("Auth.Intro");
  return (
    <main className="relative w-full flex flex-col h-screen">
      <div className="flex-1">
        <div className="flex min-h-screen w-full">
          <div
            className="hidden lg:flex lg:w-1/2 border-r flex-col p-18 relative bg-cover bg-center bg-no-repeat"
            style={{ backgroundImage: "url('/obsidian-chat.png')" }}
          >
            {/* Optional overlay for better text readability */}
            <div className="absolute inset-0 bg-black/20" />

            <div className="flex-1" />
            <FlipWords
              words={[t("description")]}
              className="mb-4 text-white relative z-10 drop-shadow-lg"
            />
          </div>

          <div className="w-full lg:w-1/2 p-6">{children}</div>
        </div>
      </div>
    </main>
  );
}
```

**Key changes:**
- Removed `Think` component (animated SVG dot)
- Removed `BackgroundPaths` component (flowing lines SVG)
- Removed grey `bg-muted` background
- Added `obsidian-chat.png` as full panel background using inline style
- Added semi-transparent black overlay (`bg-black/20`) for text readability
- Changed text to white with drop-shadow
- Kept the FlipWords component for description text at bottom

**Customization options:**
- Adjust overlay opacity: Change `bg-black/20` to `bg-black/10`, `bg-black/30`, etc.
- Remove overlay entirely: Delete the overlay div (line with `bg-black/20`)
- Change text color: Modify `text-white` if your image has different contrast needs
- Background sizing: Change `bg-cover` to `bg-contain` for different image fitting

---

### Step 5: Update Sidebar Brand Name

**File:** `src/components/layouts/app-sidebar.tsx`

**Add import at top:**
```typescript
import { uiCopy } from "@/lib/uiCopy";
```

**Find:**
```typescript
<SidebarHeaderShared
  title="better-chatbot"
  href="/"
  enableShortcuts={true}
```

**Replace with:**
```typescript
<SidebarHeaderShared
  title={uiCopy.brand}
  href="/"
  enableShortcuts={true}
```

---

### Step 6: Update Chat Preferences Placeholder

**File:** `src/components/chat-preferences-content.tsx`

**Find:**
```typescript
<Input
  placeholder="better-chatbot"
  value={preferences.botName}
```

**Replace with:**
```typescript
<Input
  placeholder="ObsidianChat"
  value={preferences.botName}
```

---

### Step 7: Update AI System Prompts

**File:** `src/lib/ai/prompts.ts`

**Find:**
```typescript
const assistantName =
  agent?.name || userPreferences?.botName || "better-chatbot";
```

**Replace with:**
```typescript
const assistantName =
  agent?.name || userPreferences?.botName || "ObsidianChat";
```

---

### Step 8: Add PNG Asset and Instructions

1. **Place your branding PNG:**
   - Copy `obsidian-chat.png` to `/public/obsidian-chat.png`

2. **Create instructions file (optional):**

**File:** `public/OBSIDIAN_CHAT_PNG_INSTRUCTIONS.md`

```markdown
# ObsidianChat PNG Image Instructions

## Required Action

You need to place your ObsidianChat branding image in this directory.

**File Requirements:**
- **Filename:** `obsidian-chat.png`
- **Location:** `/public/obsidian-chat.png`
- **Recommended Dimensions:** Design should work at various aspect ratios (responsive)
- **Format:** PNG with or without transparency
- **Purpose:** Full background image for the authentication panel (50% left side)

## Design Considerations

- The image will be displayed as `bg-cover bg-center` (fills panel, centered)
- A 20% black overlay is applied for text readability
- White text with drop-shadow appears at the bottom
- Panel is responsive and adapts to screen sizes

## Where It's Used

The PNG image is displayed in:
- Auth layout (`src/app/(auth)/layout.tsx`) - Full background of left authentication panel

## Current Status

⚠️ **The file `obsidian-chat.png` must be added to `/public/` directory.**

Once you add the PNG file, you can delete this instruction file.
```

---

## System Prompt Location

### Agent Generation "Generate With AI" Modal

The system prompt that powers the AI agent creation feature is located in:

**File:** `src/lib/ai/prompts.ts`
**Function:** `buildAgentGenerationPrompt(toolNames: string[])`
**Lines:** 19-49

**Purpose:** This prompt instructs the AI on how to generate agent configurations when users click "Generate With AI" in the Create Agent modal.

**Important Notes:**
- This prompt was **NOT modified** in the rebranding (out of scope per constraints)
- It contains the logic for translating user requirements into agent configurations
- Only the default assistant name fallback was changed in the file

**API Route:** `/api/agent/ai/route.ts` - Calls this prompt function

---

## Testing Checklist

After implementing all changes, verify the following:

### Visual/UI Tests
- [ ] Landing/sign-in page shows `obsidian-chat.png` as full left panel background
- [ ] No grey background or flowing SVG lines visible on auth page
- [ ] Text overlay at bottom of auth panel is readable (white with drop-shadow)
- [ ] Header top-left shows "ObsidianChat" (not "better-chatbot")
- [ ] Sidebar navigation shows "Shadows" (not "Agents")
- [ ] Sidebar navigation shows "ObsidianFlow" (not "Workflow")
- [ ] Sidebar navigation shows "Extensions Settings" (not "MCP Configuration")
- [ ] MCP dashboard shows "Extensions" and "My Extensions"
- [ ] MCP marketplace button shows "Add Custom Extension"
- [ ] Image generation button shows "Image Generation"
- [ ] Chat input placeholder shows "What can ObsidianAI+ do for you?"
- [ ] Agent pages show "ObsidianShadow" and "Shadows" terminology
- [ ] Agent creation greeting uses "ObsidianShadow" language
- [ ] Chat preferences placeholder shows "ObsidianChat"

### Functional Tests (Ensure Nothing Broke)
- [ ] All routes still work (/mcp, /agent, /workflow, etc.)
- [ ] MCP server configuration still functional
- [ ] Agent creation (manual and AI-generated) works
- [ ] Workflow creation works
- [ ] User menu has "Report an issue" link (GitHub)
- [ ] User menu has "Join Community" link (Discord)
- [ ] Sign-in with email/password works
- [ ] Sign-in with OAuth providers works
- [ ] Chat functionality unchanged
- [ ] Tool selection and usage unchanged

### Browser/Responsive Tests
- [ ] Desktop (>1024px): Left panel shows full background image
- [ ] Mobile (<1024px): Auth panel background not visible (only sign-in form shows)
- [ ] Background image scales properly at different screen sizes
- [ ] Text remains readable on background image

---

## Files Changed Summary

### New Files Created (2)
1. `src/lib/uiCopy.ts` - Centralized branding constants
2. `public/OBSIDIAN_CHAT_PNG_INSTRUCTIONS.md` - PNG placement instructions (optional)

### Modified Files (6)
1. `messages/en.json` - All English UI text translations
2. `src/app/(auth)/layout.tsx` - Auth panel background image
3. `src/app/layout.tsx` - Page metadata
4. `src/components/layouts/app-sidebar.tsx` - Sidebar brand name
5. `src/components/chat-preferences-content.tsx` - Placeholder text
6. `src/lib/ai/prompts.ts` - Default assistant name

### Assets Required (1)
1. `public/obsidian-chat.png` - Branding background image

---

## Rollback Instructions

If you need to revert these changes:

```bash
# If changes are not yet committed:
git checkout messages/en.json
git checkout src/app/\(auth\)/layout.tsx
git checkout src/app/layout.tsx
git checkout src/components/chat-preferences-content.tsx
git checkout src/components/layouts/app-sidebar.tsx
git checkout src/lib/ai/prompts.ts
rm src/lib/uiCopy.ts
rm public/OBSIDIAN_CHAT_PNG_INSTRUCTIONS.md
rm public/obsidian-chat.png

# If changes are committed:
git revert <commit-hash>
```

---

## Additional Language Support

If you need to update other language translation files (zh, ja, fr, es, ko), apply the same terminology changes to:

- `messages/zh.json` (Chinese)
- `messages/ja.json` (Japanese)
- `messages/fr.json` (French)
- `messages/es.json` (Spanish)
- `messages/ko.json` (Korean)

Use the English changes as a reference template for translations.

---

## Notes

- **No route changes:** All URLs remain the same (/mcp, /agent, /workflow)
- **No API changes:** All backend endpoints unchanged
- **No data model changes:** Database schemas unaffected
- **No env var changes:** Configuration keys unchanged
- **User menu:** Already had "Report an issue" and "Join Community" links (no changes needed)

---

## Version Info

- **Implementation Date:** 2025
- **Base Application:** better-chatbot
- **Target Brand:** ObsidianChat
- **Changes Applied To:** UI/Labels Only

---

## Support

If you encounter issues:
1. Verify `obsidian-chat.png` exists in `/public/` directory
2. Check that all file paths match exactly (case-sensitive)
3. Ensure translation JSON syntax is valid (no trailing commas)
4. Clear browser cache and restart dev server
5. Check browser console for image loading errors

---

**End of Guide**
