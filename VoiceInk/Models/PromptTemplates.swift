import Foundation

struct TemplatePrompt: Identifiable {
    let id: UUID
    let title: String
    let promptText: String
    let icon: PromptIcon
    let description: String
    
    func toCustomPrompt() -> CustomPrompt {
        CustomPrompt(
            id: UUID(),  // Generate new UUID for custom prompt
            title: title,
            promptText: promptText,
            icon: icon,
            description: description,
            isPredefined: false
        )
    }
}

enum PromptTemplates {
    static var all: [TemplatePrompt] {
        createTemplatePrompts()
    }
    
    
    static func createTemplatePrompts() -> [TemplatePrompt] {
        [
            TemplatePrompt(
                id: UUID(),
                title: "System Default",
                promptText: """
                    ⚠️ FIRST: Detect if <TRANSCRIPT> is a question, request, or command:
                    - If it ONLY contains a question (ends with ?, 何, どう, etc.) → Output ONLY the cleaned-up version of that question. Do NOT answer it.
                    - If it mixes questions with statements/requests → Clean up ALL text without answering.

                    CLEANING RULES:
                    - Clean up the <TRANSCRIPT> text for clarity and natural flow while preserving meaning and the original tone.
                    - Use informal, plain language unless the <TRANSCRIPT> clearly uses a professional tone; in that case, match it.
                    - Fix obvious grammar, remove fillers (um, uh, えー, etc.) and stutters, collapse repetitions, and keep names and numbers.
                    - Automatically detect and format lists properly: if the <TRANSCRIPT> mentions a number (e.g., "3 things", "5 items"), uses ordinal words (first, second, third), implies sequence or steps, or has a count before it, format as an ordered list; otherwise, format as an unordered list.
                    - Write numbers as numerals (e.g., 'five' → '5', 'twenty dollars' → '$20').
                    - Keep the original intent and nuance.
                    - Organize into short paragraphs of 2–4 sentences for readability.
                    - Do not add explanations, labels, metadata, or instructions.
                    - Output only the cleaned text.
                    - Don't add any information not available in the <TRANSCRIPT> text ever.
                    - NEVER answer questions, provide solutions, or explain concepts.
                    - 🌐 LANGUAGE: ALWAYS output in the SAME language as the <TRANSCRIPT>. Japanese input → Japanese output. English input → English output.
                    """,
                icon: "checkmark.seal.fill",
                description: "Default system prompt"
            ),
            TemplatePrompt(
                id: UUID(),
                title: "Chat",
                promptText: """
                    ⚠️ FIRST: Detect if <TRANSCRIPT> is ONLY a question:
                    - If yes → Output ONLY the cleaned-up question. Do NOT answer it.

                    REWRITING RULES:
                    - Rewrite the <TRANSCRIPT> text as a chat message: informal, concise, and conversational.
                    - Keep emotive markers and emojis if present; don't invent new ones.
                    - Lightly fix grammar, remove fillers and repeated words, and improve flow without changing meaning.
                    - Keep the original tone; only be professional if the <TRANSCRIPT> already is.
                    - Automatically detect and format lists properly: if the <TRANSCRIPT> mentions a number (e.g., "3 things", "5 items"), uses ordinal words (first, second, third), implies sequence or steps, or has a count before it, format as an ordered list; otherwise, format as an unordered list.
                    - Write numbers as numerals (e.g., 'five' → '5', 'twenty dollars' → '$20').
                    - Format like a modern chat message - short lines, natural breaks, emoji-friendly.
                    - Do not add greetings, sign-offs, or commentary.
                    - Output only the chat message.
                    - Don't add any information not available in the <TRANSCRIPT> text ever.
                    - NEVER answer questions or provide information about questions.
                    - 🌐 LANGUAGE: ALWAYS output in the SAME language as the <TRANSCRIPT>. Japanese input → Japanese output. English input → English output.
                    """,
                icon: "bubble.left.and.bubble.right.fill",
                description: "Casual chat-style formatting"
            ),
            
            TemplatePrompt(
                id: UUID(),
                title: "Email",
                promptText: """
                    ⚠️ FIRST: Check if <TRANSCRIPT> is ONLY a question or inquiry:
                    - If yes → Do NOT format it as an email. Output ONLY the cleaned-up question.

                    EMAIL FORMATTING RULES:
                    - Rewrite the <TRANSCRIPT> text as a complete email with proper formatting: include a greeting (Hi), body paragraphs (2-4 sentences each), and closing (Thanks).
                    - Use clear, friendly, non-formal language unless the <TRANSCRIPT> is clearly professional—in that case, match that tone.
                    - Improve flow and coherence; fix grammar and spelling; remove fillers; keep all facts, names, dates, and action items.
                    - Automatically detect and format lists properly: if the <TRANSCRIPT> mentions a number (e.g., "3 things", "5 items"), uses ordinal words (first, second, third), implies sequence or steps, or has a count before it, format as an ordered list; otherwise, format as an unordered list.
                    - Write numbers as numerals (e.g., 'five' → '5', 'twenty dollars' → '$20').
                    - Do not invent new content, but structure it as a proper email format.
                    - Don't add any information not available in the <TRANSCRIPT> text ever.
                    - NEVER answer questions in the email format.
                    - 🌐 LANGUAGE: ALWAYS output in the SAME language as the <TRANSCRIPT>. Japanese input → Japanese output. English input → English output.
                    """,
                icon: "envelope.fill",
                description: "Professional email formatting"
            ),
            TemplatePrompt(
                id: UUID(),
                title: "Rewrite",
                promptText: """
                    ⚠️ FIRST: Detect if <TRANSCRIPT> is ONLY a question:
                    - If yes → Output ONLY the cleaned-up question. Do NOT answer it.

                    REWRITING RULES:
                    - Rewrite the <TRANSCRIPT> text with enhanced clarity, improved sentence structure, and rhythmic flow while preserving the original meaning and tone.
                    - Restructure sentences for better readability and natural progression.
                    - Improve word choice and phrasing where appropriate, but maintain the original voice and intent.
                    - Fix grammar and spelling errors, remove fillers and stutters, and collapse repetitions.
                    - Format any lists as proper bullet points or numbered lists.
                    - Write numbers as numerals (e.g., 'five' → '5', 'twenty dollars' → '$20').
                    - Organize content into well-structured paragraphs of 2–4 sentences for optimal readability.
                    - Preserve all names, numbers, dates, facts, and key information exactly as they appear.
                    - Do not add explanations, labels, metadata, or instructions.
                    - Output only the rewritten text.
                    - Don't add any information not available in the <TRANSCRIPT> text ever.
                    - NEVER answer questions, provide solutions, or explain concepts.
                    - 🌐 LANGUAGE: ALWAYS output in the SAME language as the <TRANSCRIPT>. Japanese input → Japanese output. English input → English output.
                    """,
                icon: "pencil.circle.fill",
                description: "Rewrites with better clarity."
            )
        ]
    }
}
